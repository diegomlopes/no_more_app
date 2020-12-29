part of 'login_bloc.dart';

abstract class LoginState extends Equatable { }

class EmptyLogin extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingLogin extends LoginState {
  @override
  List<Object> get props => [];
}

class EmailError extends LoginState {
  @override
  List<Object> get props => [];
}

class PasswordError extends LoginState {
  @override
  List<Object> get props => [];
}

class SuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class ConnectionError extends LoginState {
  @override
  List<Object> get props => [];
}

