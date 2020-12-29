import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:no_more/domain/src/entities/user.dart';

abstract class LoginRepository {
  Future<Either<Exception, User>> signin({
    @required String email, 
    @required String password
  });

  Future<Either<Exception, User>> signup({
    @required User user
  });

  Future<Either<Exception, bool>> signout();

}