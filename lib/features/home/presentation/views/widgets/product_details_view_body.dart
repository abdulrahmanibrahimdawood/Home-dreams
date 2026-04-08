import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/rate_sectyion.dart';
import 'package:home_dreams/generated/l10n.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                'https://skzbelzesdrnxhsthsat.supabase.co/storage/v1/object/public/${productEntity.imageUrl!}',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: screenHeight * 0.3,
              left: screenWidth * 0.25,
              right: screenWidth * 0.25,
              child: SvgPicture.asset(Assets.assetsImagesProductIcon),
            ),
          ],
        ),
        ListTile(
          title: Text(
            productEntity.name,
            style: TextStyles.bold16.copyWith(
              color: Theme.of(context).textTheme.headlineSmall!.color,
            ),
          ),
          subtitle: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${productEntity.price} / ',
                  style: TextStyles.bold13.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: 'للقطعه',
                  style: TextStyles.bold13.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        RateSection(),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              productEntity.description,
              style: TextStyles.regular13.copyWith(
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomButton(
            onPressed: () {
              context.read<CartCubit>().addProduct(productEntity);
            },
            text: S.of(context).addToCart,
          ),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
