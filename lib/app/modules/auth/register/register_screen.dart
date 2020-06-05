import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/buttons/social_button.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/modules/auth/login/login_screen.dart';
import 'package:Clinicarx/app/modules/auth/remember/remember_screen.dart';
import 'package:Clinicarx/app/modules/auth/terms/terms.dart';
import 'package:Clinicarx/app/utils/device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  static String tag = '/register';

  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool load = false;
  String loadSocial = "";
  bool autovalidate = false;
  UserModel _user = new UserModel();

  var maskCnpjCpf = new MaskedTextController(text: '', mask: '000.000.000-00*');
  var maskTelefone =
      new MaskedTextController(text: '', mask: '(000) 00000-0000');

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Navigator.pushNamed(context, TermsScreen.tag);
    }
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
                            // controller: maskCpf,
                            // validator: (String _value) =>
                            //     validacaoStringNotNullLimit(
                            //   valor: _value,
                            //   limit: 11,
                            //   mensagem: "Cpf é obrigatório",
                            // ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              hintText: "CPF",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black38, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black38, width: 1.0),
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      // controller: maskCpf,
                      // validator: (String _value) =>
                      //     validacaoStringNotNullLimit(
                      //   valor: _value,
                      //   limit: 11,
                      //   mensagem: "Cpf é obrigatório",
                      // ),
                      decoration: InputDecoration(
                        hintText: "Senha",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1.0),
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
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      // controller: maskCpf,
                      // validator: (String _value) =>
                      //     validacaoStringNotNullLimit(
                      //   valor: _value,
                      //   limit: 11,
                      //   mensagem: "Cpf é obrigatório",
                      // ),
                      decoration: InputDecoration(
                        hintText: "Confirmar senha",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1.0),
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
                  Container(
                    margin: EdgeInsets.only(top: 28),
                    child: Text(
                      "Ou acesse com uma das contas abaixo:".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SocialButton(
                          icon: Icon(
                            FontAwesomeIcons.google,
                            size: 18,
                            color: Colors.red,
                          ),
                          load: loadSocial == "google" ? true : false,
                          onPressed: () {
//                            submitSocial("google");
                          },
                        ),
                        SocialButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            size: 18,
                            color: Colors.blue,
                          ),
                          load: loadSocial == "facebook" ? true : false,
                          onPressed: () {
//                            submitSocial("facebook");
                          },
                        ),
                        FutureBuilder(
                          future: DeviceUtils.isTheIosVersionCompatible(13),
                          builder: (_, snapshot) {
                            return Visibility(
                              child: SocialButton(
                                icon: Icon(
                                  FontAwesomeIcons.apple,
                                  size: 18,
                                ),
                                load: loadSocial == "apple" ? true : false,
                                onPressed: () {
//                                  submitSocial("apple");
                                },
                              ),
                              visible: snapshot.hasData && snapshot.data,
                            );
                          },
                        ),
                      ],
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
