import 'package:flutter/material.dart';
import 'package:home_dreams/core/utils/app_images.dart';
import 'package:home_dreams/features/home/presentation/views/cart_view.dart';
import 'package:home_dreams/features/home/presentation/views/home_view.dart';
import 'package:home_dreams/features/home/presentation/views/products_view.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/active_item.dart';
import 'package:home_dreams/features/home/presentation/views/widgets/in_active_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomBottomNavigationBar2 extends StatefulWidget {
  const CustomBottomNavigationBar2({super.key});
  static const String routeName = 'MainView2';

  @override
  CustomBottomNavigationBar2State createState() =>
      CustomBottomNavigationBar2State();
}

class CustomBottomNavigationBar2State
    extends State<CustomBottomNavigationBar2> {
  late PersistentTabController _controller;
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;
  late ScrollController _scrollController4;

  final NavBarStyle _navBarStyle = NavBarStyle.style6;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();
    _scrollController4 = ScrollController();
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    _scrollController4.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [HomeView(), ProductsView(), CartView(), Container()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ActiveItem(image: Assets.assetsImagesHomeIcon, text: 'الرئيسية'),
        inactiveIcon: InActiveItem(image: Assets.assetsImagesHomeIcon),
        scrollController: _scrollController1,
      ),
      PersistentBottomNavBarItem(
        icon: ActiveItem(
          image: Assets.assetsImagesProductIconActive,
          text: 'المنتجات',
        ),
        inactiveIcon: InActiveItem(image: Assets.assetsImagesProductIcon),
        scrollController: _scrollController2,
      ),
      PersistentBottomNavBarItem(
        icon: ActiveItem(
          image: Assets.assetsImagesCartIconActive,
          text: 'السلة',
        ),
        inactiveIcon: InActiveItem(image: Assets.assetsImagesCartIcon),
        scrollController: _scrollController3,
      ),
      PersistentBottomNavBarItem(
        icon: ActiveItem(
          image: Assets.assetsImagesProfileIconActive,
          text: 'حسابي',
        ),
        inactiveIcon: InActiveItem(image: Assets.assetsImagesProfileIcon),
        scrollController: _scrollController4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: Colors.white,
      navBarStyle: _navBarStyle,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(12),
        colorBehindNavBar: Color.fromARGB(255, 252, 250, 249),
      ),
    );
  }
}
