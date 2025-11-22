import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/services/shared_preferences_singleton.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
import 'package:home_dreams/core/widgets/custom_button.dart';
import 'package:home_dreams/features/auth/presentation/views/signin_view.dart';
import 'package:home_dreams/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();

      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final bool isActive = index == currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              width: isActive ? 18 : 9,
              height: 9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isActive
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withValues(alpha: 0.5),
              ),
            );
          }),
        ),

        SizedBox(height: 29),

        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          visible: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              onPressed: () {
                if (currentPage == 0 || currentPage == 1) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                } else {
                  Prefs.setBool(kIsOnBoardingViewSeen, true);
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(SigninView.routeName);
                }
              },
              text: currentPage == 2 ? "ابدأ الان" : 'التالي',
            ),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
