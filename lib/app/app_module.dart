import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      //$AuthStore,
      //Bind((i) => Connectivity()),
    ];
  }

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: LoginModule(),
        ),
      ];
}
