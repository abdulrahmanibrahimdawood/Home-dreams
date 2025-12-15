import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:home_dreams/core/helper_funcations/get_dummy_products.dart';
import 'package:home_dreams/core/widgets/custom_error_widget.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/no_products_widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return state.products.isEmpty
              ? SliverToBoxAdapter(child: NoProductsWidget())
              : ProductsGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMessage),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
