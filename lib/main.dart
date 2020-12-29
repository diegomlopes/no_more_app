import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:no_more/app_module.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    ModularApp(
      module: AppModule()
    )
  );
}

