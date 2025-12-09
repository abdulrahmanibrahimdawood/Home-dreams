import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/features/search/domain/repo/search_repo.dart';

part 'manage_keywords_state.dart';

class ManageKeywordsCubit extends Cubit<ManageKeywordsState> {
  final SearchRepo searchRepo;
  ManageKeywordsCubit(this.searchRepo) : super(ManageKeywordsInitial());

  Future<void> removeKeyword(String keyword) async {
    emit(ManageKeywordsLoading());
    final result = await searchRepo.removeSearchKeyWord(keyword);
    result.fold(
      (failure) => emit(ManageKeywordsFailure(errMessage: failure.message)),
      (_) => emit(ManageKeywordsSuccess()),
    );
  }

  Future<void> clearKeywords() async {
    emit(ManageKeywordsLoading());
    final result = await searchRepo.clearSearchKeyWords();
    result.fold(
      (failure) => emit(ManageKeywordsFailure(errMessage: failure.message)),
      (_) => emit(ManageKeywordsSuccess()),
    );
  }
}
