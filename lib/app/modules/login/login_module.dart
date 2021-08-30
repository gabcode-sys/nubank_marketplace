import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_marketplace/app/modules/login/presenter/login/login_controller.dart';
import 'package:nubank_marketplace/app/modules/login/presenter/login/login_page.dart';
import 'package:nubank_marketplace/app/modules/login/presenter/splashscreen/splashscreen_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => LoginController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashscreenPage()),
    ChildRoute('/login_page', child: (_, args) => LoginPage()),
  ];
}
