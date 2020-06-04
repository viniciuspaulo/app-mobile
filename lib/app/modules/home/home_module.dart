import 'package:Clinicarx/app/modules/home/attendance/attendance_screen.dart';
import 'package:Clinicarx/app/modules/home/attendance/attendances_screen.dart';
import 'package:Clinicarx/app/modules/home/home_sreen.dart';
import 'package:Clinicarx/app/modules/home/medicament/medicament_screen.dart';
import 'package:Clinicarx/app/modules/home/medicament/medicaments_screen.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_edit_screen.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_screen.dart';
import 'package:Clinicarx/app/repositorys/AttendanceRepository.dart';
import 'package:Clinicarx/app/repositorys/ClientRepository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  
  @override
  List<Bind> get binds => [
    Bind<AttendanceRepository>((i) => AttendanceRepository()),
    Bind<ClientRepository>((i) => ClientRepository())
  ];

  @override
  List<Router> get routers => [
    Router(HomeScreen.tag, child: (_, args) => HomeScreen()),
    
    Router(AttendancesScreen.tag, child: (_, args) => AttendancesScreen()),
    Router(AttendanceScreen.tag, child: (_, args) => AttendanceScreen()),

    Router(MedicamentsScreen.tag, child: (_, args) => MedicamentsScreen()),
    Router(MedicamentScreen.tag, child: (_, args) => MedicamentScreen()),

    Router(PerfilScreen.tag, child: (_, args) => PerfilScreen()),
    Router(PerfilEditScreen.tag, child: (_, args) => PerfilEditScreen()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}
