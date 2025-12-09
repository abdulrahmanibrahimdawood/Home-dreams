import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';
import 'package:home_dreams/features/search/domain/repo/search_repo.dart';

part 'add_search_keywords_state.dart';

class AddSearchKeywordsCubit extends Cubit<AddSearchKeywordsState> {
  AddSearchKeywordsCubit(this.searchRepo) : super(AddSearchKeywordsInitial());
  final SearchRepo searchRepo;

  Future<void> addSearchKeyWord(KeywordEntity keyWordEntity) async {
    emit(AddSearchKeywordsLoading());
    final result = await searchRepo.addSearchKeyWord(keyWordEntity);
    result.fold(
      (failure) => emit(AddSearchKeywordsFailure(errMessage: failure.message)),
      (success) => emit(AddSearchKeywordsSuccess()),
    );
  }
}
