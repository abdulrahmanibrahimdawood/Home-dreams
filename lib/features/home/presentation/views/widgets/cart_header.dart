import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 239, 234),
      ),
      child: Center(
        child: Text(
          'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            height: 1.60,
          ),
        ),
      ),
    );
  }
}
