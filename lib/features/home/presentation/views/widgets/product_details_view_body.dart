import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/entities/product_entity.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';

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
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                TextSpan(
                  text: 'للقطعه',
                  style: TextStyles.bold13.copyWith(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.remove, size: 18),
              ),
              const SizedBox(width: 8),
              const Text('4', style: TextStyles.bold16),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            SvgPicture.asset(Assets.assetsImagesStar),
            const SizedBox(width: 6),
            Text(
              '4.5',
              style: TextStyles.semiBold13.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '(30+)',
              style: TextStyles.semiBold13.copyWith(
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
            ),

            const SizedBox(width: 6),

            Text(
              'المراجعات',
              style: TextStyles.bold13.copyWith(
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
          ],
        ),
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
          child: CustomButton(onPressed: () {}, text: 'اضافة للسلة'),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
