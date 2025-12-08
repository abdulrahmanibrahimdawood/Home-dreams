import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';
import 'package:home_dreams/features/search/data/data_sources/search_local_data_source.dart';
import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';
import 'package:home_dreams/features/search/presentation/manager/add_search_keywords_cubit/add_search_keywords_cubit.dart';
import 'package:home_dreams/features/search/presentation/manager/cubit/search_product_cubit.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_view_body_bloc_consumer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  bool _showHistory = false;
  final List<String> _searchHistory = SearchHistoryService.getHistory();

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
                  readOnly: false,
                  onTap: () {
                    setState(() {
                      _showHistory = true;
                    });
                  },
                  onChanged: (value) {
                    context.read<SearchProductCubit>().getSearchProducts(value);
                  },
                  onSubmitted: (value) {
                    var keywordEntity = KeywordEntity(searchKeyWord: value);
                    context.read<AddSearchKeywordsCubit>().addSearchKeyWord(
                      keywordEntity,
                    );
                  },
                ),
                if (_showHistory)
                  Visibility(
                    visible: SearchHistoryService.getHistory().isNotEmpty,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
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
                            child: Row(
                              children: [
                                Text(
                                  'عمليات البحث الأخيرة',
                                  style: TextStyles.semiBold13.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    SearchHistoryService.clearHistory();
                                    setState(() {});
                                  },
                                  child: Text(
                                    'حذف الكل',
                                    style: TextStyles.semiBold13.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: _searchHistory.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                trailing: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    SearchHistoryService.removeSearch(
                                      _searchHistory[index],
                                    );
                                    setState(() {});
                                  },
                                ),
                                leading: Icon(
                                  Icons.history,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                title: Text(_searchHistory[index]),
                                onTap: () {
                                  context
                                      .read<SearchProductCubit>()
                                      .getSearchProducts(_searchHistory[index]);
                                  setState(() {
                                    _showHistory = false;
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: BlocBuilder<SearchProductCubit, SearchProductState>(
              builder: (context, state) {
                if (state is SearchProductSuccess &&
                    state.products.isNotEmpty) {
                  return Row(
                    children: [
                      Text(
                        'نتايج البحث',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF949D9E),
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SearchViewBodyBlocConsumer(),
        ],
      ),
    );
  }
}
