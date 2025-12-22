import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/features/favorites/presentation/views/manager/favorite_cubit/favorite_cubit.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/products_grid_view.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: kTopPadding)),
          ProductsGridView(
            products: context
                .read<FavoriteCubit>()
                .favoriteEntity
                .favoritesList,
          ),
        ],
      ),
    );
  }
}
