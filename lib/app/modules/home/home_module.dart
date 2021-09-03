import 'package:nubank_marketplace/app/modules/home/presenter/pages/product_details/product_details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/home/domain/usecases/get_customer_data.dart';
import 'package:nubank_marketplace/app/modules/home/domain/usecases/new_purchase.dart';
import 'package:nubank_marketplace/app/modules/home/external/drivers/flutter_connectivity_driver_impl.dart';
import 'package:nubank_marketplace/app/modules/home/infra/services/connectivity_service_impl.dart';
import 'package:nubank_marketplace/app/modules/home/presenter/pages/product_details/product_details_page.dart';

import 'external/datasource/home_remote_datasource.dart';
import 'infra/repositories/home_repository_impl.dart';
import 'presenter/pages/shop/shop_controller.dart';
import 'presenter/pages/shop/shop_page.dart';

class HomeModule extends Module {
  static List<Bind> export = [
    $GetCustomerDataImpl,
    $NewPurchaseImpl,
    $HomeRemoteDatasourceImpl,
  ];

  @override
  final List<Bind> binds = [
    $ProductDetailsController,
    $ShopController,
    $HomeRepositoryImpl,
    $FlutterConnectivityDriver,
    $ConnectivityServiceImpl,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ShopPage()),
    ChildRoute('/product_details', child: (_, args) => ProductDetailsPage()),
  ];
}
