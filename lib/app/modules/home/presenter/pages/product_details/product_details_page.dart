import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/components/product_details_body_component.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/components/product_details_bottom_navbar_component.dart';

import 'product_details_controller.dart';

class ProductDetailsPage extends StatefulWidget {
  final String title;
  const ProductDetailsPage({Key? key, this.title = 'ProductDetailsPage'})
      : super(key: key);
  @override
  ProductDetailsPageState createState() => ProductDetailsPageState();
}

class ProductDetailsPageState
    extends ModularState<ProductDetailsPage, ProductDetailsController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsBodyComponent(controller: controller),
      bottomNavigationBar:
          ProductDetailsBottomNavbarComponent(controller: controller),
    );
  }
}
