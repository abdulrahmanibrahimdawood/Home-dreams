import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/core/widgets/custom_network_image.dart';
import 'package:home_dreams/features/home/domain/entites/cart_item_entity.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:home_dreams/generated/l10n.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.carItemEntity});
  final CartItemEntity carItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdateds) {
          if (current.cartItemEntity == carItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
                child: CustomNetworkImage(
                  imageUrl: carItemEntity.productEntity.imageUrl!,
                ),
              ),
              const SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          carItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),

                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCartItem(
                              carItemEntity,
                            );
                          },
                          child: SvgPicture.asset(Assets.assetsImagesTrash),
                        ),
                      ],
                    ),
                    Text(
                      '${carItemEntity.calculateTotalWeight()} ${S.of(context).unitKg}',
                      style: TextStyles.regular13.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: carItemEntity),
                        Spacer(),
                        Text(
                          '${carItemEntity.calculateTotalPrice().toString()} ${S.of(context).currencyEgp}',
                          style: TextStyles.bold16.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
