import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubank_marketplace/app/app_widget.dart';
import 'app/app_module.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark, //status bar brigtness
    statusBarIconBrightness: Brightness.light, //status barIcon Brightness
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
