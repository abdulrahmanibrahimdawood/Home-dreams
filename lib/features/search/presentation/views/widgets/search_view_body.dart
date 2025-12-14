import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';
import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';
import 'package:home_dreams/features/search/presentation/manager/add_search_keywords_cubit/add_search_keywords_cubit.dart';
import 'package:home_dreams/features/search/presentation/manager/get_search_keyword_cubit/get_search_keyword_cubit.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_keywords_body_blocbuilder.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_view_body_bloc_consumer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController searchController = TextEditingController();
  bool showKeywords = false;
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          showKeywords = false;
        });
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SearchTextField(
                    controller: searchController,
                    readOnly: false,
                    onTap: () {
                      context.read<GetSearchKeywordCubit>().getSearchKeyWords();
                      setState(() {
                        showKeywords = true;
                      });
                    },
                    onChanged: (value) {
                      context.read<ProductsCubit>().getBestSellingProducts(
                        value,
                      );
                      setState(() {
                        showKeywords = true;
                      });
                    },
                    onSubmitted: (value) {
                      List<String> searchKeyWords = [];
                      searchKeyWords.add(value);
                      var keywordEntity = KeywordEntity(
                        searchKeyWordList: searchKeyWords,
                      );
                      context.read<AddSearchKeywordsCubit>().addSearchKeyWord(
                        keywordEntity,
                      );
                      setState(() {
                        showKeywords = false;
                      });
                    },
                  ),
                  if (showKeywords)
                    SearchKeywordsBodyBlocbuilder(
                      searchController: searchController,
                    ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SearchViewBodyBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
