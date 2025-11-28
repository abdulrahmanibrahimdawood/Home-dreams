part of 'search_product_cubit.dart';

sealed class SearchProductState extends Equatable {
  const SearchProductState();

  @override
  List<Object> get props => [];
}

final class SearchProductInitial extends SearchProductState {}

final class SearchProductLoading extends SearchProductState {}

final class SearchProductSuccess extends SearchProductState {
  final List<ProductEntity> products;
  const SearchProductSuccess({required this.products});
}

final class SearchProductFailure extends SearchProductState {
  final String errMessage;
  const SearchProductFailure({required this.errMessage});
}
