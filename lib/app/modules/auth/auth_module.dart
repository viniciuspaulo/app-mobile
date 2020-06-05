import 'package:Clinicarx/app/modules/auth/logado/logado_page.dart';
import 'package:Clinicarx/app/modules/auth/register/register_validate_screen.dart';
import 'package:Clinicarx/app/modules/auth/terms/terms.dart';
import 'package:Clinicarx/app/modules/auth/login/login_screen.dart';
import 'package:Clinicarx/app/modules/auth/register/register_screen.dart';
import 'package:Clinicarx/app/modules/auth/remember/password_screen.dart';
import 'package:Clinicarx/app/modules/auth/remember/remember_screen.dart';
import 'package:Clinicarx/app/modules/auth/remember/reset_screen.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind<ClientRepository>((i) => ClientRepository())];

  @override
  List<Router> get routers => [
        Router(LogadoPage.tag, child: (_, args) => LogadoPage()),
        Router(TermsScreen.tag, child: (_, args) => TermsScreen()),
        Router(LoginScreen.tag, child: (_, args) => LoginScreen()),
        Router(RegisterScreen.tag, child: (_, args) => RegisterScreen()),
        Router(RegisterValidateScreen.tag,
            child: (_, args) => RegisterValidateScreen()),
        Router(RememberScreen.tag, child: (_, args) => RememberScreen()),
        Router(ResetScreen.tag, child: (_, args) => ResetScreen()),
        Router(PasswordScreen.tag, child: (_, args) => PasswordScreen()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
