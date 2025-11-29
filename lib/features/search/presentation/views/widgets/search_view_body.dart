import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';
import 'package:home_dreams/features/search/presentation/manager/cubit/search_product_cubit.dart';
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
            child: SearchTextField(
              readOnly: false,
              onSubmitted: (value) {
                context.read<SearchProductCubit>().getSearchProducts(value);
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  'بحث',
                  style: TextStyles.regular13.copyWith(
                    color: Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SearchViewBodyBlocConsumer(),
        ],
      ),
    );
  }
}
