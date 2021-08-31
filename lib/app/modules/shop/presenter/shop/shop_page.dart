import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/shop/presenter/shop/shop_controller.dart';

class ShopPage extends StatefulWidget {
  final String title;
  const ShopPage({Key? key, this.title = 'ShopPage'}) : super(key: key);
  @override
  ShopPageState createState() => ShopPageState();
}

class ShopPageState extends ModularState<ShopPage, ShopController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TextButton(
        onPressed: () async {
          await controller.getCustomers();
        },
        child: Text('teste'),
      ),
    );
  }
}
