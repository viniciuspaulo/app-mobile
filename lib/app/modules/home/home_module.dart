
import 'package:Clinicarx/app/modules/home/home_page.dart';
import 'package:Clinicarx/app/modules/home/inicio/medicamentPage.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router(HomePage.tag, child: (_, args) => HomePage()),
    Router(MedicamentPage.tag, child: (_, args) => MedicamentPage()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}
