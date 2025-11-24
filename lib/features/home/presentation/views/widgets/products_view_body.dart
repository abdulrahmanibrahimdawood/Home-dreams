import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/products_view_header.dart';

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
                SearchTextField(readOnly: false),
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
}
