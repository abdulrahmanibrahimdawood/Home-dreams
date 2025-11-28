import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/errors/failures.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String name);
}
