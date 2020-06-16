import 'package:Clinicarx/app/components/alerts/snack_bar_custom.dart';
import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/modules/auth/remember/reset_screen.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class RememberScreen extends StatefulWidget {
  static String tagRota = '/remember';
  static String tag = '/remember';

  const RememberScreen({Key key}) : super(key: key);

  @override
  _RememberScreenState createState() => _RememberScreenState();
}

class _RememberScreenState extends State<RememberScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  UserModel _user = new UserModel();
  ClientRepository _repositorio = new ClientRepository();
  bool load = false;

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() => load = true);

      try {
        var result = await _repositorio.postForgotPassword(_user);
        setState(() => load = false);
        Navigator.pushNamed(context, ResetScreen.tag,
            arguments: result['token']);
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
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
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
                  image: AssetImage("assets/images/logo@3x.png"),
                  width: 200,
                  height: 60,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "Digite seu e-mail abaixo para recuperar sua senha",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    validator: validacaoEmail,
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 1.0),
                        )),
                    onSaved: (String value) {
                      _user.email = value;
                    },
                    onChanged: (String value) {
                      _user.email = value;
                    },
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: PrimaryButton(
                        text: "Enviar", onPressed: submit, load: load)),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      "Ja tenho uma conta",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
