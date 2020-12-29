import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:no_more/presentation/src/features/login/blocs/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => Modular.get<LoginBloc>(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return showState(state);
          }
        ),
      )
    ,);
  }

  Widget showState(LoginState state) {
    switch (state.runtimeType) {
      case EmptyLogin:
        return formLogin();
      case LoadingLogin:
        return loading();
      case SuccessState:
        return formLogin();
      default:
        return loading();
    }
  }

  Widget loading() {
    return Center(child: CircularProgressIndicator(),);
  }

  Widget formLogin() {
    return Padding(
      padding: EdgeInsets.all(5), 
      child: Container(
        child: Column(
          children: [
            TextField(
              controller: emailController,
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            RaisedButton(
              child: const Text('SigIn'),
              color: Colors.red,
              elevation: 4.0,
              splashColor: Colors.yellow,
              onPressed: () {
                Modular.get<LoginBloc>().add(
                  SignInEvent(
                    email: 'diego.lopes.developer@gmail.com', 
                    password: '123654'
                  )
                );
              },
            )
          ]
        )
        
      )
    );
  }
}