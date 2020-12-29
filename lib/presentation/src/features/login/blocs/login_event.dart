part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable { }

class SignInEvent extends LoginEvent {
  final String email;
  final String password;

  SignInEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [ email, password ];
}

class SignUpEvent extends LoginEvent {
  final User user;

  SignUpEvent({@required this.user});

  @override
  List<Object> get props => [ user ];
}

class SignOutEvent extends LoginEvent {
  @override
  List<Object> get props => [ ];
}

