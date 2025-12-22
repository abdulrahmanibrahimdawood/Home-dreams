import 'package:flutter/material.dart';
import 'package:home_dreams/features/auth/presentation/views/confirm_code_view.dart';
import 'package:home_dreams/features/auth/presentation/views/forget_password_view.dart';
import 'package:home_dreams/features/auth/presentation/views/new_password_view.dart';
import 'package:home_dreams/features/auth/presentation/views/signin_view.dart';
import 'package:home_dreams/features/auth/presentation/views/signup_view.dart';
import 'package:home_dreams/features/best_selling_product/presentation/views/best_selling_view.dart';
import 'package:home_dreams/features/checkout/presentation/views/checkout_view.dart';
import 'package:home_dreams/features/favorites/presentation/views/favorites_view.dart';
import 'package:home_dreams/features/home/domain/entites/cart_entity.dart';
import 'package:home_dreams/features/home/presentation/views/main_view.dart';
import 'package:home_dreams/features/on_boarding/presentation/views/on_boardig_view.dart';
import 'package:home_dreams/features/profile/presentation/views/edit_profile_view.dart';
import 'package:home_dreams/features/profile/presentation/views/who_are_we_view.dart';
import 'package:home_dreams/features/search/presentation/views/search_view.dart';
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
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordView(),
      );
    case ConfirmCodeView.routeName:
      return MaterialPageRoute(builder: (context) => const ConfirmCodeView());
    case NewPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const NewPasswordView());
    case SearchView.routeName:
      return MaterialPageRoute(builder: (context) => const SearchView());
    case EditProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const EditProfileView());
    case FavoritesView.routeName:
      return MaterialPageRoute(builder: (context) => const FavoritesView());
    case WhoAreWeView.routeName:
      return MaterialPageRoute(builder: (context) => const WhoAreWeView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
