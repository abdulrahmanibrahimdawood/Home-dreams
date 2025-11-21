import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
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
          image: Assets.assetsImages2,
          subTitle:
              'تسوق أفضل منتجات وأساس المنزل بجودة عالية وأسعار مناسبة، واطلب كل احتياجاتك بسهولة ومن مكان واحد.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك في',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 23,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                ' أحلام المنزل',
                style: TextStyle(
                  color: AppColors.lightPrimaryColor,
                  fontSize: 23,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        PageViewItem(
          isVisable: true,
          image: Assets.assetsImages3,
          subTitle:
              'اكتشف تشكيلة واسعة من منتجات البيت والأثاث وخليك دايمًا جاهز لكل احتياجات منزلك مع تجربة شراء سهلة وسريعة.',
          title: Text(
            'منزلك أهم',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        PageViewItem(
          isVisable: false,
          image: Assets.assetsImages1,
          subTitle:
              'وفر وقتك ومجهودك وتسوق أساس ومنتجات المنزل بأفضل الأسعار مع توصيل سريع وخدمة مضمونة لحد باب بيتك.',
          title: Text(
            'تسوق بذكاء',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryColor,
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
