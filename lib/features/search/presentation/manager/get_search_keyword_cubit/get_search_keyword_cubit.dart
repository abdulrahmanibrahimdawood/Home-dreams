import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';
import 'package:home_dreams/features/search/domain/repo/search_repo.dart';

part 'get_search_keyword_state.dart';

class GetSearchKeywordCubit extends Cubit<GetSearchKeywordState> {
  GetSearchKeywordCubit(this.searchRepo) : super(GetSearchKeywordInitial());
  final SearchRepo searchRepo;

  Future<void> getSearchKeyWords() async {
    emit(GetSearchKeywordLoading());
    final result = await searchRepo.getSearchKeyWords();
    result.fold(
      (failure) => emit(GetSearchKeywordFailure(errMessage: failure.message)),
      (products) => emit(GetSearchKeywordSuccess(keyWords: products)),
    );
  }
}
