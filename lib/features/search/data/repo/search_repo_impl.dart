import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/helper_funcations/get_user.dart';
import 'package:home_dreams/core/services/data_service.dart';
import 'package:home_dreams/core/utils/backend_endpoints.dart';
import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';
import 'package:home_dreams/features/search/domain/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final DatabaseServices databaseServices;

  SearchRepoImpl({required this.databaseServices});

  @override
  // Future<Either<Failure, List<ProductEntity>>> searchProducts(
  //   String name,
  // ) async {
  //   try {
  //     var allData =
  //         await databaseServices.getData(path: BackendEndpoints.getProducts)
  //             as List<Map<String, dynamic>>;
  //     final searchTerm = name.trim().toLowerCase();
  //     final filteredData = allData.where((product) {
  //       final productName = (product['name'] ?? '').toString().toLowerCase();
  //       return productName.contains(searchTerm);
  //     }).toList();
  //     filteredData.sort((a, b) {
  //       final aCount = (a['sellingCount'] ?? 0) as int;
  //       final bCount = (b['sellingCount'] ?? 0) as int;
  //       return bCount.compareTo(aCount);
  //     });
  //     List<ProductEntity> products = filteredData
  //         .map((e) => ProductModel.fromJson(e).toEntity())
  //         .toList();
  //     return right(products);
  //   } catch (e) {
  //     return left(ServerFailure('Failed to search products: ${e.toString()}'));
  //   }
  // }
  @override
  Future<Either<Failure, void>> addSearchKeyWord(
    KeywordEntity keyWordEntity,
  ) async {
    try {
      await databaseServices.updateData(
        path: BackendEndpoints.searchKeyWord,
        documentId: getUser().uId,
        data: {
          "searchKeywords": FieldValue.arrayUnion(
            keyWordEntity.searchKeyWordList,
          ),
        },
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add keyword: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getSearchKeyWords() async {
    try {
      final doc = await databaseServices.getData(
        path: BackendEndpoints.getSearchKeyWord,
        documentId: getUser().uId,
      );

      if (doc == null) return right([]);

      final List<String> keyWords = List<String>.from(
        doc["searchKeywords"] ?? [],
      );
      return right(keyWords);
    } catch (e) {
      return left(
        ServerFailure('Failed to get Search KeyWords: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeSearchKeyWord(String keyword) async {
    try {
      await databaseServices.updateData(
        path: BackendEndpoints.searchKeyWord,
        documentId: getUser().uId,
        data: {
          "searchKeywords": FieldValue.arrayRemove([keyword]),
        },
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to remove keyword: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearSearchKeyWords() async {
    try {
      await databaseServices.updateData(
        path: BackendEndpoints.searchKeyWord,
        documentId: getUser().uId,
        data: {"searchKeywords": []},
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to clear keywords: ${e.toString()}'));
    }
  }
}
