import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:home_dreams/core/helper_funcations/build_error_bar.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:home_dreams/features/search/presentation/views/widgets/no_products_widgets.dart';

class SearchViewBodyBlocConsumer extends StatelessWidget {
  const SearchViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsFailure) {
          showBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is ProductsLoading) {
          return SliverToBoxAdapter(
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: const Center(child: Text('هناك خطأ ما')),
          );
        } else if (state is ProductsSuccess) {
          return state.products.isEmpty
              ? SliverToBoxAdapter(child: NoProductsWidget())
              : ProductsGridView(products: state.products);
        } else {
          return ProductsGridView(products: []);
        }
      },
    );
  }
}
