import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/models/product_model.dart';
import 'package:home_dreams/core/services/data_service.dart';
import 'package:home_dreams/core/utils/backend_endpoints.dart';
import 'package:home_dreams/features/search/data/models/keyword_model.dart';
import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';
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

  @override
  Future<Either<Failure, void>> addSearchKeyWord(
    KeywordEntity keyWordEntity,
  ) async {
    try {
      await databaseServices.addData(
        path: BackendEndpoints.searchKeyWord,
        data: KeywordModel.fromEntity(keyWordEntity).toJson(),
        documentId: getUser().uId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<KeywordEntity>>> getSearchKeyWords() async {
    try {
      final data = await databaseServices.getData(
        path: BackendEndpoints.getSearchKeyWord,
        documentId: getUser().uId,
      );

      // ---------- استخراج الليست بشكل آمن ----------
      List<Map<String, dynamic>> list = [];

      if (data is List) {
        list = data.map((e) => Map<String, dynamic>.from(e)).toList();
      } else if (data is Map) {
        // لو Firebase بيرجع Map فيه الكلمات تحت مفتاح معين
        if (data.containsKey('keywords') && data['keywords'] is List) {
          list = (data['keywords'] as List)
              .map((e) => Map<String, dynamic>.from(e))
              .toList();
        } else {
          // لو Map فردي → حوّله List عنصر واحد
          list = [Map<String, dynamic>.from(data)];
        }
      }

      // ---------- تحويل لـ Entities ----------
      List<KeywordEntity> keywords = list
          .map((e) => KeywordModel.fromJson(e).toEntity())
          .toList();

      return right(keywords);
    } catch (e) {
      return Left(
        ServerFailure('Failed to get Search KeyWords: ${e.toString()}'),
      );
    }
  }
}
