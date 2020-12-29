import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:no_more/domain/src/entities/user.dart';
import 'package:no_more/domain/src/repositories/login_repository.dart';
import 'package:no_more/domain/src/usecases/params/signup_params.dart';
import 'package:no_more/domain/src/usecases/usecase.dart';

class SignUp extends UseCase<User, SignUpParams> {
  final LoginRepository repository;

  SignUp({@required this.repository});

  @override
  Future<Either<Exception, User>> call(SignUpParams params) async {
    return await repository.signup(
      user: params.user);
  }

}