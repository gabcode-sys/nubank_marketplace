import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/shop/presenter/components/default_app_bar_widget.dart';
import 'package:nubank_marketplace/app/modules/shop/presenter/components/default_body_widget.dart';
import 'package:nubank_marketplace/app/modules/shop/presenter/components/default_bottom_nav_bar_widget.dart';
import 'package:nubank_marketplace/app/modules/shop/presenter/pages/shop/shop_controller.dart';
import 'package:nubank_marketplace/app/utils/theme/theme_color.dart';

class ShopPage extends StatefulWidget {
  final String title;
  const ShopPage({Key? key, this.title = 'ShopPage'}) : super(key: key);
  @override
  ShopPageState createState() => ShopPageState();
}

class ShopPageState extends ModularState<ShopPage, ShopController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.backgroundTheme,
      appBar: DefaultAppBar(controller: controller),
      body: DefaultBodyWidget(controller: controller),
      bottomNavigationBar: DefaultBottomNavBarWidget(controller: controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
