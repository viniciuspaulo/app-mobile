import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/buttons/secondary_button.dart';
import 'package:Clinicarx/app/components/buttons/social_button.dart';

import 'package:Clinicarx/app/modules/home/home_sreen.dart';
import 'package:Clinicarx/app/modules/auth/terms/terms.dart';

import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/repositorys/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  static String tag = '/login';
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool loading = false;
  bool showPassword = false;

  var maskCpf = new MaskedTextController(text: '', mask: '000.000.000-00');
  UserModel _user = new UserModel();
  ClientRepository _repositorio = new ClientRepository();

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() => loading = true);
      try {
        await _repositorio.postLogin(_user);
        setState(() => loading = false);
        Navigator.pushReplacementNamed(context, HomeScreen.tagRota);
      } catch (mensagem) {
        Toast.show(mensagem, context);
        setState(() => loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/logo.png"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.only(top: 8),
              child: Text(
                "Organizamos tudo para que você gerencie melhor sua saúde",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(vertical: 16),
              child: TextFormField(
                controller: maskCpf,
                validator: (String _value) => validacaoStringNotNullLimit(
                  valor: _value,
                  limit: 11,
                  mensagem: "Cpf é obrigatório",
                ),
                decoration: InputDecoration(
                  hintText: "CPF",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
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
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                obscureText: !showPassword,
                validator: (String _value) => validacaoStringNotNullLimit(
                  valor: _value,
                  mensagem: "Senha é obrigatória",
                ),
                decoration: InputDecoration(
                  hintText: "Senha",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
                  ),
                  suffixIcon: IconButton(
                    icon: showPassword
                        ? Icon(FontAwesomeIcons.eyeSlash, color: Colors.black54)
                        : Icon(
                            FontAwesomeIcons.eye,
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
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(vertical: 16),
                child: PrimaryButton(
                    text: "Entrar", onPressed: submit, loading: loading)),
            InkWell(
              onTap: () {
                print("Esqueceu");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  "Esqueceu a senha ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.only(top: 28),
              child: Text(
                "Ou acesse com uma das contas abaixo:".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
                    onPressed: () {},
                  ),
                  SocialButton(
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      size: 18,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  SocialButton(
                    icon: Icon(
                      FontAwesomeIcons.apple,
                      size: 18,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.only(top: 28),
                child: SecundaryButton(
                  text: "NOVO POR AQUI? CADASTRE-SE",
                  onPressed: () {
                    Navigator.pushNamed(context, TermsScreen.tag);
                  }
                )),
          ],
        ),
      ),
    ));
  }
}
