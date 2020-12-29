import 'package:flutter/material.dart';
import 'package:no_more/domain/src/entities/user.dart';

class SignUpParams {
  User user;

  SignUpParams({
    @required this.user
  });
}