import 'package:flutter/material.dart';
import 'package:no_more/data/src/datasources/remote/login_remote_datasource.dart';
// import 'package:no_more/data/src/utils/connection_checker.dart';
import 'package:no_more/domain/src/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:no_more/domain/src/repositories/login_repository.dart';
// import 'package:no_more/domain/src/usecases/errors/not_connection.dart';

class LoginRepositoryData implements LoginRepository {

  final LoginRemoteDataSource dataSource;

  LoginRepositoryData({@required this.dataSource});

  @override
  Future<Either<Exception, User>> signin({String email, String password}) async {
    // if (await connectionChecker.isConnected) {
      return await dataSource.signin(
        email: email, 
        password: password
      );
    // } else {
    //   return Left(NoConnection());
    // }
  }
  
  @override
  Future<Either<Exception, bool>> signout() async {
    // if (await connectionChecker.isConnected) {
      return await dataSource.signout();
    // } else {
    //   return Left(NoConnection());
    // }
  }
  
  @override
  Future<Either<Exception, User>> signup({User user}) async {
    // if (await connectionChecker.isConnected) {
      return await dataSource.signup(user: user);
    // } else {
    //   return Left(NoConnection());
    // }
  }

}