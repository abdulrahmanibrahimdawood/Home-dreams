import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/helper_funcations/build_error_bar.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/features/checkout/presentation/views/checkout_view.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: CheckoutView(
                  cartEntity: context.read<CartCubit>().cartEntity,
                ),
                withNavBar: true,
              );
            } else {
              showBar(context, 'لا يوجد منتجات في السلة');
            }
          },
          text:
              'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
        );
      },
    );
  }
}
