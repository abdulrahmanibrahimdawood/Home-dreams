import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:home_dreams/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisable: true,
          image: Assets.assetsImagesOnboarding1,
          subTitle: s.onboarding1Subtitle,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                s.onboardingWelcome,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 23,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                s.onboardingBrand,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryContainer,
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
          image: Assets.assetsImagesOnboarding2,
          subTitle: s.onboarding2Subtitle,
          title: Text(
            s.onboarding2Title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        PageViewItem(
          isVisable: false,
          image: Assets.assetsImagesOnboarding3,
          subTitle: s.onboarding3Subtitle,
          title: Text(
            s.onboarding3Title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
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
