import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:no_more/domain/src/repositories/login_repository.dart';
import 'package:no_more/domain/src/usecases/params/no_params.dart';
import 'package:no_more/domain/src/usecases/usecase.dart';

class SignOut extends UseCase<bool, NoParams> {
  final LoginRepository repository;

  SignOut({@required this.repository});

  @override
  Future<Either<Exception, bool>> call(NoParams params) async {
    return await repository.signout();
  }

}