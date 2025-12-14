import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  int productsLength = 0;
  final ProductsRepo productRepo;
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts([String? keyword]) async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProducts(keyword: keyword);
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) {
        productsLength = products.length;
        emit(ProductsSuccess(products: products));
      },
    );
  }
}
