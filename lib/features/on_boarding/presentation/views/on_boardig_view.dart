import 'package:flutter/material.dart';
import 'package:home_dreams/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = 'onBoardingView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const OnBoardingViewBody()));
  }
}
