import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/models/product_model.dart';
import 'package:home_dreams/core/services/data_service.dart';
import 'package:home_dreams/core/utils/backend_endpoints.dart';
import 'package:home_dreams/features/search/domain/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final DatabaseServices databaseServices;

  SearchRepoImpl({required this.databaseServices});

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
    String name,
  ) async {
    try {
      var data =
          await databaseServices.getData(
                path: BackendEndpoints.getProducts,
                query: {
                  'search': name,
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
}
