import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:home_dreams/core/repos/products_repo/product_repo_impl.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/products_view_header.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/filter_modal_bottom_sheet.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                buildAppBarInside(
                  context,
                  title: 'المنتجات',
                  showBackButton: false,
                ),
                SizedBox(height: kTopPadding),
                SearchTextField(
                  onSubmitted: (value) {
                    context.read<ProductsCubit>().getProducts(
                      searchKeyword: value,
                    );
                  },
                  onChanged: (value) async {
                    context.read<ProductsCubit>().getProducts(
                      searchKeyword: value,
                    );
                  },
                  readOnly: false,
                  onTapIcon: () async {
                    FilterParams? filter = await filterWith(context);
                    context.read<ProductsCubit>().getProducts(filter: filter);
                  },
                ),
                SizedBox(height: 12),
                ProductsViewHeader(
                  productsLength: context.read<ProductsCubit>().productsLength,
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }

  Future<FilterParams?> filterWith(BuildContext context) async {
    FilterParams? filter;
    final sort = await showFilterBottomSheet(context);
    if (sort != null) {
      if (sort == 'lowToHigh') {
        filter = FilterParams(sortBy: SortBy.priceLowToHigh);
      } else if (sort == 'highToLow') {
        filter = FilterParams(sortBy: SortBy.priceHighToLow);
      }
    }
    return filter;
  }
}
