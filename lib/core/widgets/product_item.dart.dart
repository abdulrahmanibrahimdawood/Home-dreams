import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_network_image.dart';
import 'package:home_dreams/features/favorites/presentation/views/manager/favorite_cubit/favorite_cubit.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/generated/l10n.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.read<FavoriteCubit>();
    final cartCubit = context.read<CartCubit>();
    return Container(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final isFavorite = favoriteCubit.favoriteEntity.isExist(
                  productEntity,
                );
                return IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      favoriteCubit.deleteFavoriteProduct(productEntity);
                    } else {
                      favoriteCubit.addFavoriteProduct(productEntity);
                    }
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite
                        ? Colors.red
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 40),
                productEntity.imageUrl != null
                    ? SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: CustomNetworkImage(
                          imageUrl: productEntity.imageUrl!,
                        ),
                      )
                    : Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                        ),
                      ),
                SizedBox(height: 4),
                ListTile(
                  title: Text(
                    productEntity.name,
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold13,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${productEntity.price} ${S.of(context).pricePerEgp}',
                          style: TextStyles.bold13.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: GestureDetector(
                    onTap: () => cartCubit.addProduct(productEntity),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
