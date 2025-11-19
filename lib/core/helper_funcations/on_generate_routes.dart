import 'package:flutter/material.dart';
import 'package:home_dreams/features/auth/presentation/views/signin_view.dart';
import 'package:home_dreams/features/auth/presentation/views/signup_view.dart';
import 'package:home_dreams/features/best_selling_product/presentation/views/best_selling_view.dart';
import 'package:home_dreams/features/checkout/presentation/views/checkout_view.dart';
import 'package:home_dreams/features/home/domain/entites/cart_entity.dart';
import 'package:home_dreams/features/home/presentation/views/main_view.dart';
import 'package:home_dreams/features/on_boarding/presentation/views/on_boardig_view.dart';
import 'package:home_dreams/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            CheckoutView(cartEntity: settings.arguments as CartEntity),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
