import 'package:Clinicarx/app/modules/home/attendance/attendance_screen.dart';
import 'package:Clinicarx/app/modules/home/attendance/attendances_screen.dart';
import 'package:Clinicarx/app/modules/home/home_sreen.dart';
import 'package:Clinicarx/app/modules/home/medicines/medicine_screen.dart';
import 'package:Clinicarx/app/modules/home/medicines/medicines_screen.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_edit_screen.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_screen.dart';
import 'package:Clinicarx/app/modules/home/sidemenu/about.dart';
import 'package:Clinicarx/app/modules/home/sidemenu/about_terms.dart';
import 'package:Clinicarx/app/repositories/AppointmentsRepository.dart';
import 'package:Clinicarx/app/repositories/AttendanceRepository.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/repositories/MedicineRepository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<AttendanceRepository>((i) => AttendanceRepository()),
        Bind<AppointmentsRepository>((i) => AppointmentsRepository()),
        Bind<MedicineRepository>((i) => MedicineRepository()),
        Bind<ClientRepository>((i) => ClientRepository())
      ];

  @override
  List<Router> get routers => [
        Router(HomeScreen.tag, child: (_, args) => HomeScreen()),
        Router(AttendancesScreen.tag, child: (_, args) => AttendancesScreen()),
        Router(AttendanceScreen.tag, child: (_, args) => AttendanceScreen()),
        Router(MedicineScreen.tag, child: (_, args) => MedicineScreen()),
        Router(MedicinesScreen.tag, child: (_, args) => MedicinesScreen()),
        Router(PerfilScreen.tag, child: (_, args) => PerfilScreen()),
        Router(PerfilEditScreen.tag, child: (_, args) => PerfilEditScreen()),
        Router(AboutScreen.tag, child: (_, args) => AboutScreen()),
        Router(AboutTermsScreen.tag, child: (_, args) => AboutTermsScreen()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
