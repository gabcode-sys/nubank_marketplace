import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:nubank_marketplace/app/modules/shop/presenter/pages/shop/shop_controller.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';

class DefaultBottomNavBarWidget extends StatelessWidget {
  final String title;
  final ShopController controller;
  const DefaultBottomNavBarWidget({
    Key? key,
    this.title = "DefaultBottomNavBarWidget",
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: 0,
      containerHeight: 80,
      showElevation: false,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          title: Text('Shop'),
          activeColor: ThemeColor.defaultTheme,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.history_rounded),
            title: Text('History'),
            activeColor: ThemeColor.widgetForegroundTheme),
        BottomNavyBarItem(
            icon: Icon(Icons.person_rounded),
            title: Text('User'),
            activeColor: ThemeColor.widgetForegroundTheme),
      ],
      onItemSelected: (int value) {},
    );
  }
}
