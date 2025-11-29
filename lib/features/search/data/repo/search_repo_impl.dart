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
      var allData =
          await databaseServices.getData(path: BackendEndpoints.getProducts)
              as List<Map<String, dynamic>>;
      final searchTerm = name.trim().toLowerCase();
      final filteredData = allData.where((product) {
        final productName = (product['name'] ?? '').toString().toLowerCase();
        return productName.contains(searchTerm);
      }).toList();
      filteredData.sort((a, b) {
        final aCount = (a['sellingCount'] ?? 0) as int;
        final bCount = (b['sellingCount'] ?? 0) as int;
        return bCount.compareTo(aCount);
      });
      List<ProductEntity> products = filteredData
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to search products: ${e.toString()}'));
    }
  }
}
