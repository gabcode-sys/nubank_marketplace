import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/shop/domain/usecases/get_customer_data.dart';
import 'package:nubank_marketplace/app/modules/shop/external/datasource/shop_remote_datasource.dart';
import 'package:nubank_marketplace/app/modules/shop/external/drivers/flutter_connectivity_driver_impl.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/repositories/shop_repository_impl.dart';
import 'package:nubank_marketplace/app/modules/shop/infra/services/connectivity_service_impl.dart';

import 'presenter/pages/shop/shop_controller.dart';
import 'presenter/pages/shop/shop_page.dart';

class ShopModule extends Module {
  static List<Bind> export = [
    $GetCustomerDataImpl,
    $ShopRemoteDatasourceImpl,
  ];

  @override
  final List<Bind> binds = [
    $ShopController,
    $ShopRepositoryImpl,
    $FlutterConnectivityDriver,
    $ConnectivityServiceImpl,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ShopPage()),
  ];
}
