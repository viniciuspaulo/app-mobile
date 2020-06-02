

import 'package:Clinicarx/app/modules/home/HomePage.dart';
import 'package:Clinicarx/app/modules/home/tabs/MedicamentsPage.dart';
import 'package:Clinicarx/app/modules/home/tabs/AttendancesPage.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router(HomePage.tag, child: (_, args) => HomePage()),
    Router(AttendancesPage.tag, child: (_, args) => AttendancesPage()),
    Router(MedicamentsPage.tag, child: (_, args) => MedicamentsPage()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}
