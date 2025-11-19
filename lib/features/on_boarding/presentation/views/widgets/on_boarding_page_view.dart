import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisable: true,
          backgroundImage: Assets.assetsImagesBackGround,
          image: Assets.assetsImagesPageViewImage1,
          subTitle:
              'اكتشف تجربة تسوّق مميزة مع Shopify! استعرض مجموعتنا الواسعة من المنتجات المتنوعة، وتمتع بأفضل العروض والجودة العالية في مكان واحد.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('مرحبًا بك في'), Text('Shopify')],
          ),
        ),
        PageViewItem(
          isVisable: false,

          backgroundImage: Assets.assetsImagesBackGround,
          image: Assets.assetsImagesPageViewImage2,
          subTitle:
              'نقدّم لك أفضل المنتجات المختارة بعناية. استعرض التفاصيل والصور والتقييمات لتتأكد من اختيار المنتج المثالي.',
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
