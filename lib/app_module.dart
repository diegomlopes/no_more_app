import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:no_more/app_widget.dart';
import 'package:no_more/data/src/datasources/remote/login_remote_datasource.dart';
import 'package:no_more/data/src/repositories/login_repository_data.dart';
import 'package:no_more/data/src/utils/connection_checker.dart';
import 'package:no_more/domain/src/repositories/login_repository.dart';
import 'package:no_more/domain/src/usecases/signin.dart';
import 'package:no_more/domain/src/usecases/signout.dart';
import 'package:no_more/domain/src/usecases/signup.dart';
import 'package:no_more/presentation/src/features/login/blocs/login_bloc.dart';
import 'package:no_more/presentation/src/features/login/pages/login_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind<LoginBloc>(
        (i) => LoginBloc(signIn: i(), signUp: i(), signOut: i()),
        singleton: true,
        lazy: true
      ),
      Bind<SignIn>(
        (i) => SignIn(repository: i()),
        singleton: true,
        lazy: true
      ),
      Bind<LoginRepository>(
        (i) => LoginRepositoryData(dataSource: i()),
        singleton: true,
        lazy: true
      ),
      Bind<LoginRemoteDataSource>(
        (i) => LoginRemoteDataSource(),
        singleton: true,
        lazy: true
      ),
      Bind<SignUp>(
        (i) => SignUp(repository: i()),
        singleton: true,
        lazy: true
      ),
      Bind<SignOut>(
        (i) => SignOut(repository: i()),
        singleton: true,
        lazy: true
      ),
    ];
  }

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers {
    return [
      ModularRouter('/login', child: (_, __) => LoginPage()),
    ];
  }

}