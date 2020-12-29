import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:no_more/domain/src/entities/user.dart';
import 'package:no_more/domain/src/repositories/login_repository.dart';
import 'package:no_more/domain/src/usecases/params/signin_params.dart';
import 'package:no_more/domain/src/usecases/usecase.dart';

class SignIn extends UseCase<User, SignInParams> {
  final LoginRepository repository;

  SignIn({@required this.repository});

  @override
  Future<Either<Exception, User>> call(SignInParams params) async {
    return await repository.signin(
      email: params.email, 
      password: params.password);
  }

}