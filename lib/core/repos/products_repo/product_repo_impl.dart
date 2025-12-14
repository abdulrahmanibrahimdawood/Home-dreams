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
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts({
    String? keyword,
  }) async {
    try {
      final data = await databaseServices.getData(
        path: BackendEndpoints.getProducts,
        query: {
          'limit': 10,
          'orderBy': 'sellingCount',
          'descending': true,
          if (keyword != null && keyword.isNotEmpty)
            'keyword': keyword.toLowerCase(),
        },
      );

      final List<ProductEntity> products = data
          .map<ProductEntity>(
            (e) => ProductModel.fromJson(e as Map<String, dynamic>).toEntity(),
          )
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

// Future<List<Product>> getProducts({
//   String? keyword,
//   FilterParams? filter,
// }) async {
//   Query query = FirebaseFirestore.instance.collection('products');

//   /// 🔍 Search
//   if (keyword != null && keyword.trim().isNotEmpty) {
//     query = query.where('keywords', arrayContains: keyword.toLowerCase());
//   }

//   /// 💰 Filter (Range)
//   if (filter?.minPrice != null) {
//     query = query.where('price', isGreaterThanOrEqualTo: filter!.minPrice);
//   }

//   if (filter?.maxPrice != null) {
//     query = query.where('price', isLessThanOrEqualTo: filter!.maxPrice);
//   }

//   /// ⬆⬇ Sort
//   if (filter?.priceHighToLow != null) {
//     query = query.orderBy('price', descending: filter!.priceHighToLow!);
//   }

//   final snapshot = await query.get();

//   return snapshot.docs
//       .map((e) => Product.fromJson(e.data() as Map<String, dynamic>))
//       .toList();
// }
