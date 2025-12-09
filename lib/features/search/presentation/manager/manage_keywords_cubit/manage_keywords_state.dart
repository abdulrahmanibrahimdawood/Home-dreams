part of 'manage_keywords_cubit.dart';

sealed class ManageKeywordsState extends Equatable {
  const ManageKeywordsState();

  @override
  List<Object> get props => [];
}

final class ManageKeywordsInitial extends ManageKeywordsState {}

final class ManageKeywordsFailure extends ManageKeywordsState {
  final String errMessage;
  const ManageKeywordsFailure({required this.errMessage});
}

final class ManageKeywordsSuccess extends ManageKeywordsState {}

final class ManageKeywordsLoading extends ManageKeywordsState {}
