import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class EsqueciPage extends StatefulWidget {
  static String tagRota = '/esqueci';
  static String tag = '/esqueci';

  const EsqueciPage({Key key}) : super(key: key);

  @override
  _EsqueciPageState createState() => _EsqueciPageState();
}

class _EsqueciPageState extends State<EsqueciPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool load = false;
  
  // Mascaras
  var maskCnpjCpf = new MaskedTextController(text: '',mask: '000.000.000-00*');
  var maskTelefone = new MaskedTextController(text: '',mask: '(000) 00000-0000');


  salvar() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      
    }
  }


  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueci senha"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: this._formKey,
          child: Text("Esqueci senha"),
        )
      )
    );
  }
}
