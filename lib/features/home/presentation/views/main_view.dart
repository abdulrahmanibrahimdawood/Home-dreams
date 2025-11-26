import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_dreams/core/custom_bottom_navigation_bar2.dart';
import 'package:home_dreams/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 18),
            child: CustomBottomNavigationBar2(),
          ),
        ),
        body: const SizedBox.shrink(),
      ),
    );
  }
}
