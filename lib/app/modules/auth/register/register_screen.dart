import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class RegisterScreen extends StatefulWidget {
  static String tagRota = '/register';
  static String tag = '/register';

  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool load = false;
  bool autovalidate = false;

  // Mascaras
  var maskCnpjCpf = new MaskedTextController(text: '',mask: '000.000.000-00*');
  var maskTelefone = new MaskedTextController(text: '',mask: '(000) 00000-0000');

  salvar() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      // Navigator.pushReplacementNamed(context, HomePage.tagRota);
    }
  }



  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Cadastro")
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          autovalidate: autovalidate,
          key: this._formKey,
          child: ListView(
            children: <Widget>[

            ],
          ),
        )
      )
    );
  }
}
