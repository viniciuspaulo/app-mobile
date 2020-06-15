import 'package:Clinicarx/app/components/alerts/snack_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'dart:async';

import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/buttons/secondary_button.dart';
import 'package:Clinicarx/app/components/connect.dart';
import 'package:Clinicarx/app/components/buttons/container_social_buttons.dart';

import 'package:Clinicarx/app/modules/auth/register/register_validate_screen.dart';
import 'package:Clinicarx/app/modules/auth/remember/remember_screen.dart';
import 'package:Clinicarx/app/modules/home/home_sreen.dart';

import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:connectivity/connectivity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  static String tag = '/login';
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  bool load = false;
  String loadSocial = "";
  bool showPassword = false;

  var maskCpf = new MaskedTextController(text: '', mask: '000.000.000-00');
  UserModel _user = new UserModel();
  ClientRepository _repositorio = new ClientRepository();

  StreamSubscription<ConnectivityResult> subscription;
  ConnectivityResult statusConnect;

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() => load = true);
      try {
        await _repositorio.postLogin(_user);
        setState(() => load = false);
        Navigator.pushReplacementNamed(context, HomeScreen.tagRota);
      } catch (mensagem) {
        snackBarCustom(
          scaffoldKey: _scaffoldKey,
          title: mensagem,
          color: Colors.red,
          colorText: Colors.white,
        );
        setState(() => load = false);
      }
    }
  }

  @override
  initState() {
    super.initState();

    //Verifica conexao com internet
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() => statusConnect = result);
    });

    (Connectivity().checkConnectivity()).then((connectivityResult) {
      setState(() => statusConnect = connectivityResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    return statusConnect != ConnectivityResult.wifi &&
            statusConnect != ConnectivityResult.mobile
        ? Connect()
        : Scaffold(
            key: _scaffoldKey,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/logo.png"),
                          width: 200,
                          height: 60,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Organizamos tudo para que você gerencie melhor sua saúde",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
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
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 1.0),
                                )),
                            onSaved: (String value) {
                              _user.document = value;
                            },
                            onChanged: (String value) {
                              _user.document = value;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            obscureText: !showPassword,
                            validator: (String _value) =>
                                validacaoStringNotNull(
                              valor: _value,
                              mensagem: "Senha é obrigatória",
                            ),
                            decoration: InputDecoration(
                              hintText: "Senha",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 1.0),
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
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          child: PrimaryButton(
                              text: "Entrar", onPressed: submit, load: load),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RememberScreen.tag);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              "Esqueceu a senha?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black38,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 28),
                          child: Text(
                            "Ou acesse com uma das contas abaixo:"
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 28),
                          child: ContainerSocialButtons(),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 28),
                          child: SecondaryButton(
                            text: "NOVO POR AQUI? CADASTRE-SE",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegisterValidateScreen.tag);
                            },
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
