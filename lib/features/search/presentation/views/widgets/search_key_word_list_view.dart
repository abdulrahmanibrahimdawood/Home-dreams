import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/features/search/presentation/manager/get_search_keyword_cubit/get_search_keyword_cubit.dart';
import 'package:home_dreams/features/search/presentation/manager/manage_keywords_cubit/manage_keywords_cubit.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_keyword_header.dart';

class SearchKeywordsBody extends StatelessWidget {
  const SearchKeywordsBody({
    super.key,
    required this.searchController,
    required this.keywords,
  });

  final TextEditingController searchController;
  final List<String> keywords;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 8,
              left: 38,
              right: 20,
            ),
            child: SearchKeywordHeader(
              onClearAll: () {
                searchController.clear();
              },
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: keywords.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    searchController.text = '';
                    context
                        .read<ManageKeywordsCubit>()
                        .removeKeyword(keywords[index])
                        .then((_) {
                          context
                              .read<GetSearchKeywordCubit>()
                              .getSearchKeyWords();
                        });
                  },
                ),
                leading: Icon(Icons.history, size: 20, color: Colors.grey),
                title: Text(keywords[index]),
                onTap: () {
                  searchController.text = keywords[index];
                  // context.read<SearchProductCubit>().getSearchProducts(
                  //   keywords[index],
                  // );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
