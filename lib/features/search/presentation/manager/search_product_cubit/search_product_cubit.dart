import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo.dart';

part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  final ProductsRepo productsRepo;
  SearchProductCubit(this.productsRepo) : super(SearchProductInitial());

  Future<void> getSearchProducts(String name) async {
    emit(SearchProductLoading());
    final result = await productsRepo.getBestSellingProducts(keyword: name);
    result.fold(
      (failure) => emit(SearchProductFailure(errMessage: failure.message)),
      (products) => emit(SearchProductSuccess(products: products)),
    );
  }
}
