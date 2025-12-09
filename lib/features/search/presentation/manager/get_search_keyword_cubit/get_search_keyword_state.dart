part of 'get_search_keyword_cubit.dart';

sealed class GetSearchKeywordState extends Equatable {
  const GetSearchKeywordState();

  @override
  List<Object> get props => [];
}

final class GetSearchKeywordInitial extends GetSearchKeywordState {}

final class GetSearchKeywordLoading extends GetSearchKeywordState {}

final class GetSearchKeywordFailure extends GetSearchKeywordState {
  final String errMessage;
  const GetSearchKeywordFailure({required this.errMessage});
}

final class GetSearchKeywordSuccess extends GetSearchKeywordState {
  final List<String> keyWords;
  const GetSearchKeywordSuccess({required this.keyWords});
}
