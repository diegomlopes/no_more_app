import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:no_more/app_module.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ModularApp(module: AppModule()));
}
