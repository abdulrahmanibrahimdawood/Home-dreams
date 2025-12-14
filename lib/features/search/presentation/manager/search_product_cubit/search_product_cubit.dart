import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/features/search/domain/repo/search_repo.dart';

part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  final SearchRepo searchRepo;
  SearchProductCubit(this.searchRepo) : super(SearchProductInitial());

  Future<void> getSearchProducts(String name) async {
    emit(SearchProductLoading());
    final result = await searchRepo.searchProducts(name);
    result.fold(
      (failure) => emit(SearchProductFailure(errMessage: failure.message)),
      (products) => emit(SearchProductSuccess(products: products)),
    );
  }
}
