import 'package:dartz/dartz.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/errors/failures.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo_impl.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    FilterParams? filter,
    String? searchKeyword,
    FilterParams? postSearchFilter,
  });
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
