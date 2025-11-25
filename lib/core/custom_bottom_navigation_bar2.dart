import 'package:flutter/cupertino.dart';
import 'package:home_dreams/features/home/presentation/views/cart_view.dart';
import 'package:home_dreams/features/home/presentation/views/home_view.dart';
import 'package:home_dreams/features/home/presentation/views/products_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomBottomNavigationBar2 extends StatefulWidget {
  const CustomBottomNavigationBar2({super.key});
  static const String routeName = 'MainView2';

  @override
  _CustomBottomNavigationBar2State createState() =>
      _CustomBottomNavigationBar2State();
}

class _CustomBottomNavigationBar2State
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
    return [
      HomeView(), // Screen 1
      ProductsView(), // Screen 2
      CartView(), // Screen 3
      Container(), // Screen 4
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        contentPadding: 10,
        icon: Icon(CupertinoIcons.home),
        title: "الرئيسية",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: _scrollController1,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.search),
        title: "Search",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: _scrollController2,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart),
        title: "Favorites",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: _scrollController3,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: "Settings",
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
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
      backgroundColor: const Color.fromARGB(255, 110, 39, 39),
      navBarStyle: _navBarStyle,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10),
        colorBehindNavBar: const Color.fromARGB(255, 208, 199, 199),
      ),
    );
  }
}
