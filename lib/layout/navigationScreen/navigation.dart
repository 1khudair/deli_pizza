import 'package:deli_pizza/Screens/home.dart';
import 'package:deli_pizza/Screens/my_cart.dart';
import 'package:deli_pizza/Screens/my_orders.dart';
import 'package:deli_pizza/Screens/products.dart';
import 'package:deli_pizza/layout/ProfileScreen/profile.dart';
import 'package:deli_pizza/models/dataProvider.dart';
import 'package:deli_pizza/share/components/components.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NavigationPage extends StatelessWidget {
  PersistentTabController? _controller;
  PageController pageController = PageController();
  List<Widget> tabs = [
    const ProfileScreen(),
    const MyCartPage(),
    const MyOrdersPage(),
    const Products(),
    const HomePage(),
  ];

  List<PersistentBottomNavBarItem> items = [
    buildBottomNavBarItem(
        iconData: Icons.account_circle_outlined, title: "الحساب"),
    buildBottomNavBarItem(
        iconData: Icons.shopping_cart_outlined, title: "السلة"),
    buildBottomNavBarItem(iconData: Icons.receipt_outlined, title: "طلباتي"),
    buildBottomNavBarItem(iconData: Icons.dashboard_outlined, title: "المنيو"),
    buildBottomNavBarItem(iconData: Icons.home_outlined, title: "الرئيسية"),
  ];

  NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dp = Provider.of<DataProvider>(context);
    return PersistentTabView(
      context,
      screens: tabs,
      controller: _controller,
      items: items,
      navBarStyle: NavBarStyle.style6,
      resizeToAvoidBottomInset: true,
      onItemSelected: (index) {},
      screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 150)),
    );
    // return Scaffold(
    //   body: PageView(
    //     children: tabs,
    //     controller: pageController,
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     currentIndex: navBar.index,
    //     onTap: (index) {
    //       navBar.setCurrentIndex(index: index);
    //       pageController.jumpToPage(index);
    //     },
    //     selectedItemColor: const Color.fromRGBO(255, 0, 0, 1),
    //     unselectedItemColor: const Color.fromRGBO(74, 74, 74, 1),
    //     iconSize: 22,
    //     selectedFontSize: 13,
    //     unselectedFontSize: 12,
    //     type: BottomNavigationBarType.fixed,
    //     selectedLabelStyle: const TextStyle(
    //       fontSize: 10,
    //       fontFamily: "din",
    //       fontWeight: FontWeight.w400,
    //     ),
    //     unselectedLabelStyle: const TextStyle(
    //       fontSize: 10,
    //       fontFamily: "din",
    //       fontWeight: FontWeight.w400,
    //     ),
    //     items: items,
    //   ),
    // );
  }
}
