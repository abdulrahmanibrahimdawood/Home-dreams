import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: itemWidth * .4,
                child: Image.asset(
                  Assets.assetsImagesAppIconsss,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Svg(Assets.assetsImagesCartIcon),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 33.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Text(
                        'عروض العيد',
                        style: TextStyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'خصم 25%',
                        style: TextStyles.bold19.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 11),
                      FeaturedItemButton(onPressed: () {}),
                      SizedBox(height: 29),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
