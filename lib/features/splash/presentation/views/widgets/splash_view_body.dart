import 'package:flutter/material.dart';
import 'package:home_dreams/constants.dart';
import 'package:home_dreams/core/services/firebase_auth_service.dart';
import 'package:home_dreams/core/services/shared_preferences_singleton.dart';
import 'package:home_dreams/core/utils/app_colors.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/core/utils/app_text_styles.dart';
import 'package:home_dreams/features/auth/presentation/views/signin_view.dart';
import 'package:home_dreams/features/home/presentation/views/main_view.dart';
import 'package:home_dreams/features/on_boarding/presentation/views/on_boardig_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    excuteNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.40,
            child: Image.asset(
              Assets.assetsImagesAppIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            'أحلام المنزل',
            style: TextStyles.bold28.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

  void excuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        if (!mounted) return;
        var isLoggedIn = FirebaseAuthService().isLoggedIn();
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        }
      } else {
        if (!mounted) return;

        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
