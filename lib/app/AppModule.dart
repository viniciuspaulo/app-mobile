
import 'package:Clinicarx/app/AppWidget.dart';
import 'package:Clinicarx/app/modules/auth/auth_module.dart';
import 'package:Clinicarx/app/modules/home/homeModule.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router('/', module: AuthModule()),
    Router('/home', module: HomeModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
