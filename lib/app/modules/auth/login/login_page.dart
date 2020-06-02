
import 'package:Clinicarx/app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {

  static String tag = '/login';
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool load = false;
  bool autovalidate = false;

  // Mascaras
  var maskCnpjCpf = new MaskedTextController(text: '',mask: '000.000.000-00*');
  var maskTelefone = new MaskedTextController(text: '',mask: '(000) 00000-0000');

  salvar() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();


      try {
        Navigator.pushReplacementNamed(context, HomePage.tagRota);
      }catch(message) {
        setState(() => load = false);
        Toast.show(message, context,duration: Toast.LENGTH_LONG);
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: this._formKey,
        autovalidate: autovalidate,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Text("Login")
            ],
          ),
        ),
      )
    );
  }
}
