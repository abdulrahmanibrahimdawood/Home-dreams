import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_dreams/core/helper_funcations/build_error_bar.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:home_dreams/features/search/presentation/manager/cubit/search_product_cubit.dart';

class SearchViewBodyBlocConsumer extends StatelessWidget {
  const SearchViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchProductCubit, SearchProductState>(
      listener: (context, state) {
        if (state is SearchProductFailure) {
          showBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SearchProductLoading) {
          return SliverToBoxAdapter(
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is SearchProductFailure) {
          return SliverToBoxAdapter(
            child: const Center(child: Text('هناك خطأ ما')),
          );
        } else if (state is SearchProductSuccess) {
          return state.products.isEmpty
              ? SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),

                          Text(
                            'لاتوجد نتائج بحث',
                            style: TextStyles.semiBold13.copyWith(
                              color: const Color(0xFF949D9E),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.08,
                          ),
                          SvgPicture.asset(Assets.assetsImagesNoporducts),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.05,
                          ),
                          Text(
                            'عفوًا... هذه المعلومات غير متوفرة للحظة',
                            style: TextStyles.semiBold13.copyWith(
                              color: const Color(0xFF949D9E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : ProductsGridView(products: state.products);
        } else {
          return ProductsGridView(products: []);
        }
      },
    );
  }
}
