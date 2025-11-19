import 'dart:developer';

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
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseServices.getData(
                path: BackendEndpoints.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(
        ServerFailure('Failed to get best selling products: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseServices.getData(path: BackendEndpoints.getProducts)
              as List<Map<String, dynamic>>;
      // List<ProductModel> products = data
      //     .map((e) => ProductModel.fromJson(e))
      //     .toList();
      // List<ProductEntity> productsEntities = products
      //     .map((e) => e.toEntity())
      //     .toList();
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      log(e.toString());
      return left(ServerFailure('Failed to get products: ${e.toString()}'));
    }
  }
}
