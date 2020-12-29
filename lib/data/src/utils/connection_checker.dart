import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

class ConnectionChecker {
  final DataConnectionChecker checker;

  ConnectionChecker({@required this.checker});

  Future<bool> get isConnected => checker.hasConnection;
}