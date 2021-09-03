import 'package:connectivity/connectivity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/core/injection/register_module.dart';
import 'package:nubank_marketplace/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      ...HomeModule.export,
      //$AuthStore,
      $RegisterModule,
      Bind((i) => Connectivity()),
    ];
  }

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: HomeModule(),
        ),
      ];
}
