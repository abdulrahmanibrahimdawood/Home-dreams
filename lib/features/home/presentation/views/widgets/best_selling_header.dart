import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/best_selling_product/presentation/views/best_selling_view.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('الأكثر مبيعًا', style: TextStyles.bold16),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.read<CartCubit>()),
                    BlocProvider.value(value: context.read<CartItemCubit>()),
                  ],
                  child: const BestSellingView(),
                ),
              ),
            );
          },
          child: Text(
            'المزيد',
            style: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
          ),
        ),
      ],
    );
  }
}
