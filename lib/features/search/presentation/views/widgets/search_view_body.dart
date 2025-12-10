import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';
import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';
import 'package:home_dreams/features/search/presentation/manager/add_search_keywords_cubit/add_search_keywords_cubit.dart';
import 'package:home_dreams/features/search/presentation/manager/get_search_keyword_cubit/get_search_keyword_cubit.dart';
import 'package:home_dreams/features/search/presentation/manager/search_product_cubit/search_product_cubit.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/filter_modal_bottom_sheet.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_keywords_body_blocbuilder.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_view_bloc_builder.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_view_body_bloc_consumer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SearchTextField(
                  onTapIcon: () {
                    showFilterBottomSheet(context);
                  },
                  controller: searchController,
                  readOnly: false,
                  onTap: () {
                    context.read<GetSearchKeywordCubit>().getSearchKeyWords();
                  },
                  onChanged: (value) {
                    context.read<SearchProductCubit>().getSearchProducts(value);
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
                  },
                ),
                SearchKeywordsBodyBlocbuilder(
                  searchController: searchController,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(child: SearchViewBlocBuilder()),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SearchViewBodyBlocConsumer(),
        ],
      ),
    );
  }
}
