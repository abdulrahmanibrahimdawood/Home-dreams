import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/models/product_model.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo.dart';
import 'package:home_dreams/core/services/data_service.dart';
import 'package:home_dreams/core/utils/backend_endpoints.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseServices databaseServices;

  ProductsRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts({
    FilterParams? filter,
    String? searchKeyword,
    FilterParams? postSearchFilter,
  }) async {
    try {
      var data =
          await databaseServices.getData(
                path: BackendEndpoints.getProducts,
                query:
                    (filter == null &&
                        postSearchFilter == null &&
                        searchKeyword == null)
                    ? {'orderBy': 'sellingCount', 'descending': true}
                    : {
                        'limit': 10,
                        'orderBy': 'sellingCount',
                        'descending': true,
                      },
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      if (searchKeyword != null && searchKeyword.trim().isNotEmpty) {
        final searchWords = searchKeyword.toLowerCase().split(' ');

        products = products.where((product) {
          final nameLower = product.name.toLowerCase();
          return searchWords.every((word) => nameLower.contains(word));
        }).toList();
      }

      if (filter != null && filter.sortBy != null) {
        switch (filter.sortBy!) {
          case SortBy.priceHighToLow:
            products.sort((a, b) => b.price.compareTo(a.price));
            break;

          case SortBy.priceLowToHigh:
            products.sort((a, b) => a.price.compareTo(b.price));
            break;

          case SortBy.reset:
            break;
        }
      }

      return right(products);
    } catch (e) {
      return left(
        ServerFailure('Failed to get best selling products: ${e.toString()}'),
      );
    }
  }

  // @override
  // Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts({
  //   FilterParams? filter,
  //   String? searchKeyword,
  //   FilterParams? postSearchFilter,
  // }) async {
  //   try {
  //     var data =
  //         await databaseServices.getData(
  //               path: BackendEndpoints.getProducts,
  //               query: {
  //                 'limit': 10,
  //                 'orderBy': 'sellingCount',
  //                 'descending': true,
  //               },
  //             )
  //             as List<Map<String, dynamic>>;
  //     List<ProductEntity> products = data
  //         .map((e) => ProductModel.fromJson(e).toEntity())
  //         .toList();
  //     return right(products);
  //   } catch (e) {
  //     return left(
  //       ServerFailure('Failed to get best selling products: ${e.toString()}'),
  //     );
  //   }
  // }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    FilterParams? filter,
    String? searchKeyword,
    FilterParams? postSearchFilter,
  }) async {
    try {
      Query query = FirebaseFirestore.instance.collection(
        BackendEndpoints.getProducts,
      );
      if (filter != null) {
        if (filter.sortBy != null) {
          switch (filter.sortBy!) {
            case SortBy.priceHighToLow:
              query = query.orderBy('price', descending: true);
              break;
            case SortBy.priceLowToHigh:
              query = query.orderBy('price');
              break;
            case SortBy.reset:
              break;
          }
        }
      }
      final snapshot = await query.get();
      List<ProductEntity> products = snapshot.docs
          .map(
            (e) => ProductModel.fromJson(
              e.data() as Map<String, dynamic>,
            ).toEntity(),
          )
          .toList();

      if (searchKeyword != null && searchKeyword.trim().isNotEmpty) {
        final searchWords = searchKeyword.toLowerCase().split(' ');
        products = products.where((product) {
          final nameLower = product.name.toLowerCase();
          return searchWords.every((word) => nameLower.contains(word));
        }).toList();
      }
      return right(products);
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure('Failed to get products: ${e.toString()}'));
    }
  }

  // @override
  // Future<Either<Failure, List<ProductEntity>>> getProducts() async {
  //   try {
  //     var data =
  //         await databaseServices.getData(path: BackendEndpoints.getProducts)
  //             as List<Map<String, dynamic>>;
  //     // List<ProductModel> products = data
  //     //     .map((e) => ProductModel.fromJson(e))
  //     //     .toList();
  //     // List<ProductEntity> productsEntities = products
  //     //     .map((e) => e.toEntity())
  //     //     .toList();
  //     List<ProductEntity> products = data
  //         .map((e) => ProductModel.fromJson(e).toEntity())
  //         .toList();
  //     return right(products);
  //   } catch (e) {
  //     log(e.toString());
  //     return left(ServerFailure('Failed to get products: ${e.toString()}'));
  //   }
  // }
}

enum SortBy { priceHighToLow, priceLowToHigh, reset }

class FilterParams {
  final SortBy? sortBy;

  FilterParams({this.sortBy});
}
