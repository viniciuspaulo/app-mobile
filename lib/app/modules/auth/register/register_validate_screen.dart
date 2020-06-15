import 'package:Clinicarx/app/components/buttons/container_social_buttons.dart';
import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/modules/auth/login/login_screen.dart';
import 'package:Clinicarx/app/modules/auth/register/register_screen.dart';
import 'package:Clinicarx/app/modules/auth/terms/terms.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

class RegisterValidateScreen extends StatefulWidget {
  static String tag = '/register-validate';

  const RegisterValidateScreen({Key key}) : super(key: key);

  @override
  _RegisterValidateScreenState createState() => _RegisterValidateScreenState();
}

class _RegisterValidateScreenState extends State<RegisterValidateScreen> {
  final repositorio = Modular.get<ClientRepository>();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool load = false;
  bool showPassword = false;
  bool showPasswordConfirm = false;
  String loadSocial = "";
  bool autovalidate = false;
  UserModel _user = new UserModel();

  var maskCpf = new MaskedTextController(text: '', mask: '000.000.000-00');

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (_user.provider == null &&
          _user.password != null &&
          _user.passwordConfirm != null) {
        if (_user.password != _user.passwordConfirm) {
          Toast.show("Senhas são diferentes.", context);
          return;
        }
      }

      setState(() => load = true);
      try {
        await repositorio.getSearchDocument(_user.document);
        setState(() => load = false);
        Navigator.pushNamed(
          context,
          TermsScreen.tag,
          arguments: {'user': _user, 'nextScreen': RegisterScreen.tag},
        );
      } catch (msg) {
        setState(() => load = false);
        Toast.show(msg, context);
        return;
      }
    }
  }

  @override
  initState() {
    Future.delayed(Duration.zero, () {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      if (arguments != null) {
        setState(() {
          _user = arguments;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Form(
            key: this._formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 200,
                    height: 60,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      "Organizamos tudo para que você gerencie melhor sua saúde",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: maskCpf,
                            validator: (String _value) =>
                                validacaoStringNotNullLimit(
                              valor: _value,
                              limit: 11,
                              mensagem: "Cpf é obrigatório",
                            ),
                            decoration: InputDecoration(
                              hintText: "CPF",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 1.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[700], width: 1.0),
                              ),
                            ),
                            onSaved: (String value) {
                              _user.document = value;
                            },
                            onChanged: (String value) {
                              _user.document = value;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: InkWell(
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.black54,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _user.provider == null,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        obscureText: !showPassword,
                        validator: (String _value) => validacaoStringNotNull(
                          valor: _value,
                          mensagem: "Senha é obrigatória",
                        ),
                        decoration: InputDecoration(
                          hintText: "Senha",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red[700], width: 1.0),
                          ),
                          suffixIcon: IconButton(
                            icon: showPassword
                                ? Icon(FontAwesomeIcons.eye,
                                    size: 20, color: Colors.black54)
                                : Icon(
                                    FontAwesomeIcons.eyeSlash,
                                    size: 20,
                                    color: Colors.black54,
                                  ),
                            onPressed: () {
                              setState(() => showPassword = !showPassword);
                            },
                          ),
                        ),
                        onSaved: (String value) {
                          _user.password = value;
                        },
                        onChanged: (String value) {
                          _user.password = value;
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _user.provider == null,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        obscureText: !showPasswordConfirm,
                        validator: (String _value) => validacaoStringNotNull(
                          valor: _value,
                          mensagem: "Senha é obrigatória",
                        ),
                        decoration: InputDecoration(
                          hintText: "Confirmar senha",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red[700], width: 1.0),
                          ),
                          suffixIcon: IconButton(
                            icon: showPasswordConfirm
                                ? Icon(FontAwesomeIcons.eye,
                                    size: 20, color: Colors.black54)
                                : Icon(
                                    FontAwesomeIcons.eyeSlash,
                                    size: 20,
                                    color: Colors.black54,
                                  ),
                            onPressed: () {
                              setState(() =>
                                  showPasswordConfirm = !showPasswordConfirm);
                            },
                          ),
                        ),
                        onSaved: (String value) {
                          _user.passwordConfirm = value;
                        },
                        onChanged: (String value) {
                          _user.passwordConfirm = value;
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: PrimaryButton(
                        text: "Cadastrar", onPressed: submit, load: load),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, LoginScreen.tag);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        "Já tenho uma conta",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black38,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _user.provider == null,
                    child: Container(
                      margin: EdgeInsets.only(top: 28),
                      child: Text(
                        "Ou acesse com uma das contas abaixo:".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _user.provider == null,
                    child: Container(
                      margin: EdgeInsets.only(top: 28),
                      child: ContainerSocialButtons(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
