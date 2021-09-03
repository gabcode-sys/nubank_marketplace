import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/components/shop_app_bar_component.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/components/shop_body_component.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/pages/shop/shop_controller.dart';
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
      appBar: ShopAppBarComponent(controller: controller),
      body: ShopBodyComponent(controller: controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
