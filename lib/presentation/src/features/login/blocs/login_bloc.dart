import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_more/domain/src/entities/user.dart';
import 'package:no_more/domain/src/usecases/errors/invalid_email.dart';
import 'package:no_more/domain/src/usecases/errors/invalid_password.dart';
import 'package:no_more/domain/src/usecases/params/no_params.dart';
import 'package:no_more/domain/src/usecases/params/signin_params.dart';
import 'package:no_more/domain/src/usecases/params/signup_params.dart';
import 'package:no_more/domain/src/usecases/signin.dart';
import 'package:no_more/domain/src/usecases/signout.dart';
import 'package:no_more/domain/src/usecases/signup.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final SignIn signIn;
  final SignUp signUp;
  final SignOut signOut;

  LoginBloc({
    @required this.signIn, 
    @required this.signUp,
     @required this.signOut
  }): super(EmptyLogin());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is SignInEvent) {
      yield LoadingLogin();
      print("Email");
      print(event.email);
      final result = await signIn(SignInParams(email: event.email, password: event.password));
      print("Saiu");
      yield result.fold((l) {
        if (l is InvalidEmail) {
          return EmailError();
        } else if (l is InvalidPassword) {
          return PasswordError();
        } else {
          return ConnectionError();
        }
      }, (r) {
        return SuccessState();
      });

    } else if (event is SignOutEvent) {
      yield LoadingLogin();
      final result = await signOut(NoParams());

      yield result.fold((l) {
        if (l is InvalidEmail) {
          return EmailError();
        } else if (l is InvalidPassword) {
          return PasswordError();
        } else {
          return ConnectionError();
        }
      }, (r) {
        return SuccessState();
      });

    } else if (event is SignUpEvent) {
      yield LoadingLogin();
      final result = await signUp(SignUpParams(user: event.user));

      yield result.fold((l) {
        return LoadingLogin();
      }, (r) {
        return SuccessState();
      });
    }
  }

}