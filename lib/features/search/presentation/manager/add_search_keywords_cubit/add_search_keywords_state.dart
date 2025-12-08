part of 'add_search_keywords_cubit.dart';

sealed class AddSearchKeywordsState extends Equatable {
  const AddSearchKeywordsState();

  @override
  List<Object> get props => [];
}

final class AddSearchKeywordsInitial extends AddSearchKeywordsState {}

final class AddSearchKeywordsSuccess extends AddSearchKeywordsState {}

final class AddSearchKeywordsFailure extends AddSearchKeywordsState {
  final String errMessage;
  const AddSearchKeywordsFailure({required this.errMessage});
}

final class AddSearchKeywordsLoading extends AddSearchKeywordsState {}
