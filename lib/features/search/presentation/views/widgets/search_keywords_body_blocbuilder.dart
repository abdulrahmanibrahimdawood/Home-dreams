import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/features/search/presentation/manager/get_search_keyword_cubit/get_search_keyword_cubit.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_key_word_list_view.dart';

class SearchKeywordsBodyBlocbuilder extends StatelessWidget {
  const SearchKeywordsBodyBlocbuilder({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSearchKeywordCubit, GetSearchKeywordState>(
      builder: (context, state) {
        if (state is GetSearchKeywordFailure) {
          return Text(state.errMessage);
        } else if (state is GetSearchKeywordSuccess &&
            state.keyWords.isNotEmpty) {
          return SearchKeywordsBody(
            searchController: searchController,
            keywords: state.keyWords,
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
