import 'package:flutter/material.dart';
import 'package:home_dreams/features/home/domain/entites/cart_item_entity.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/cart_item.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/custom_divider.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.carItems});
  final List<CartItemEntity> carItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
      itemCount: carItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(carItemEntity: carItems[index]),
        );
      },
    );
  }
}
