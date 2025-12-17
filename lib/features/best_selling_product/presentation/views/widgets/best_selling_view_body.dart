import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 24)),

          BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartItemAdded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تمت إضافة المنتج إلى السلة')),
                );
              }
            },
            child: const ProductsGridViewBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
