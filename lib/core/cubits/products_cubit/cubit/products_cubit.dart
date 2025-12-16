import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo_impl.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  int productsLength = 0;
  final ProductsRepo productRepo;
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  Future<void> getProducts({
    FilterParams? filter,
    String? searchKeyword,
    FilterParams? postSearchFilter,
  }) async {
    emit(ProductsLoading());
    final result = await productRepo.getProducts(
      filter: filter,
      searchKeyword: searchKeyword,
      postSearchFilter: postSearchFilter,
    );
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts({
    FilterParams? filter,
    String? searchKeyword,
    FilterParams? postSearchFilter,
  }) async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProducts(
      filter: filter,
      searchKeyword: searchKeyword,
      postSearchFilter: postSearchFilter,
    );
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) {
        productsLength = products.length;
        emit(ProductsSuccess(products: products));
      },
    );
  }
}
