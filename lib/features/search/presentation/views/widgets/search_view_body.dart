import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';
import 'package:home_dreams/features/search/data/data_sources/search_local_data_source.dart';
import 'package:home_dreams/features/search/presentation/manager/cubit/search_product_cubit.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/search_view_body_bloc_consumer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: SearchTextField(
              readOnly: false,
              onChanged: (value) {
                context.read<SearchProductCubit>().getSearchProducts(value);
              },
              onSubmitted: (value) {
                SearchHistoryService.addSearch(value);
              },
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
