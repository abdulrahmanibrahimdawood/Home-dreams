import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String name);
  Future<Either<Failure, void>> addSearchKeyWord(KeywordEntity keyWordEntity);
  Future<Either<Failure, List<String>>> getSearchKeyWords();
}
