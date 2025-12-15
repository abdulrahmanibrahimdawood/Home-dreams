import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:home_dreams/core/widgets/search_text_field.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:home_dreams/features/search/presentation/views/search_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
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
                CustomHomeAppBar(),
                SizedBox(height: kTopPadding),
                SearchTextField(
                  readOnly: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<CartCubit>(),
                          child: const SearchView(),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 12),
                BestSellingHeader(),
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
