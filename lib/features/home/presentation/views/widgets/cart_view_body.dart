import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/widgets/custom_app_bar_inside.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/cart_header.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/cart_items_list.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/custom_divider.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: kTopPadding),
                  buildAppBarInside(
                    context,
                    title: 'السلة',
                    showNotification: false,
                  ),
                  SizedBox(height: 12),
                  CartHeader(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : CustomDivider(),
            ),
            CartItemsList(
              carItems: context.read<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: CustomCartButton(),
        ),
      ],
    );
  }
}
