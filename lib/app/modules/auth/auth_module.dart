
import 'package:Clinicarx/app/modules/auth/cadastro/cadastro_page.dart';
import 'package:Clinicarx/app/modules/auth/esqueci/esqueci_page.dart';
import 'package:Clinicarx/app/modules/auth/logado/logado_page.dart';
import 'package:Clinicarx/app/modules/auth/login/login_page.dart';
import 'package:Clinicarx/app/modules/auth/terms/terms.dart';
import 'package:flutter_modular/flutter_modular.dart';
class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [ ];

  @override
  List<Router> get routers => [
    Router(LogadoPage.tag, child: (_, args) => LogadoPage()),
    Router(LoginPage.tag, child: (_, args) => LoginPage()),
    Router(CadastroPage.tag, child: (_, args) => CadastroPage()),
    Router(EsqueciPage.tag, child: (_, args) => EsqueciPage()),
    Router(TermsScreen.tag, child: (_, args) => TermsScreen()),
  ];

  static Inject get to => Inject<AuthModule>.of();
}
