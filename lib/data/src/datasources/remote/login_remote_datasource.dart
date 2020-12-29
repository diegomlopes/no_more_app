import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter/material.dart';
import 'package:no_more/data/src/datasources/login_datasource.dart';
import 'package:no_more/domain/src/entities/user.dart';
import 'package:no_more/domain/src/usecases/errors/invalid_email.dart';
import 'package:no_more/domain/src/usecases/errors/invalid_password.dart';

class LoginRemoteDataSource implements LoginDataSource {
  final _auth = Auth.FirebaseAuth.instance;
  @override
  Future<Either<Exception, User>> signin(
      {@required String email, @required String password}) async {
    try {
      print("Entrou");
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("Passou");
      return Right(User(
          email: email,
          imageUrl: null,
          name: null,
          password: null,
          role: null));
    } catch (e) {
      print("Erro");
      print(e);
      if (e.code == 'user-not-found') {
        return Left(InvalidEmail());
      } else if (e.code == 'wrong-password') {
        return Left(InvalidPassword());
      }
      return Left(InvalidEmail());
    }
  }

  @override
  Future<Either<Exception, User>> signup({@required User user}) async {
    try {
      await Auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      return Right(User(
          email: user.email,
          imageUrl: null,
          name: null,
          password: null,
          role: null));
    } on Auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(InvalidPassword());
      } else if (e.code == 'email-already-in-use') {
        return Left(InvalidEmail());
      }
      return Left(InvalidEmail());
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> signout() async {
    try {
      await Auth.FirebaseAuth.instance.signOut();
      return Right(true);
    } catch (e) {
      return Left(e);
    }
  }
}
