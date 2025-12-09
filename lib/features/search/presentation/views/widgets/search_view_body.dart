import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';
import 'package:home_dreams/features/search/domain/entities/keyword_entity.dart';
import 'package:home_dreams/features/search/presentation/manager/add_search_keywords_cubit/add_search_keywords_cubit.dart';
import 'package:home_dreams/features/search/presentation/manager/get_search_keyword_cubit/get_search_keyword_cubit.dart';
import 'package:home_dreams/features/search/presentation/manager/search_product_cubit/search_product_cubit.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_view_body_bloc_consumer.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

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
                // Icon(Icons.search, color: Colors.grey),
                BlocBuilder<GetSearchKeywordCubit, GetSearchKeywordState>(
                  builder: (context, state) {
                    if (state is GetSearchKeywordFailure) {
                      return Text(state.errMessage);
                    } else if (state is GetSearchKeywordSuccess) {
                      return Container(
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
                                    onTap: () {},
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
                              itemCount: state.keyWords.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  trailing: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {},
                                  ),
                                  leading: Icon(
                                    Icons.history,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  title: Text(state.keyWords[index]),
                                  onTap: () {
                                    context
                                        .read<SearchProductCubit>()
                                        .getSearchProducts(
                                          state.keyWords[index],
                                        );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
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
