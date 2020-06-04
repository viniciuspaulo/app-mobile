import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/modules/auth/login/login_screen.dart';
import 'package:Clinicarx/app/repositorys/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class PasswordScreen extends StatefulWidget {
  static String tagRota = '/password';
  static String tag = '/password';

  const PasswordScreen({Key key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
 final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  ClientRepository _repositorio = new ClientRepository();
  bool load = false;
  String token = "";
  String password = "";
  String confirmPassword = "";
  
  bool showPassword = false;

  submit() async {

    if (password != confirmPassword) {
      Toast.show("A senhas não sao iguais.", context);
      return;
    }

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() => load = true);
      
      try {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", token);

        await _repositorio.postUpdatePassword(password);

        setState(() => load = false);
        prefs.remove("token");

        Toast.show("A senhas alterada com sucesso.", context);
        Navigator.pushReplacementNamed(context, LoginScreen.tag);
      } catch(mensagem) {
        Toast.show(mensagem, context);
        setState(() => load = false);
      }
    }
  }


  @override
  initState() {
    Future.delayed(Duration.zero,(){
      token = ModalRoute.of(context).settings.arguments;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black54
        ),
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
                image: AssetImage("assets/images/logo.png"),
              ),
              
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.only(top: 8),
                child: Text("Se houver uma conta vinculada a esse e-mail você receberá um código para alterar sua senha.",
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  obscureText: !showPassword,
                  validator: (String _value) => validacaoStringNotNull(
                    valor: _value,
                    mensagem: "Senha é obrigatória",
                  ),
                  decoration: InputDecoration(
                    hintText: "Nova senha",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                    suffixIcon: IconButton(
                      icon: showPassword ? 
                        Icon(FontAwesomeIcons.eyeSlash, color: Colors.black54) : 
                        Icon(FontAwesomeIcons.eye, color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() => showPassword =! showPassword);
                      },
                    ),
                  ),
                  onSaved: (String value) {
                    password = value;
                  },
                  onChanged: (String value) {
                    password = value;
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  obscureText: !showPassword,
                  validator: (String _value) => validacaoStringNotNull(
                    valor: _value,
                    mensagem: "Senha é obrigatória",
                  ),
                  decoration: InputDecoration(
                    hintText: "Confirmar senha",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                    suffixIcon: IconButton(
                      icon: showPassword ? 
                        Icon(FontAwesomeIcons.eyeSlash, color: Colors.black54) : 
                        Icon(FontAwesomeIcons.eye, color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() => showPassword =! showPassword);
                      },
                    ),
                  ),
                  onSaved: (String value) {
                    confirmPassword = value;
                  },
                  onChanged: (String value) {
                    confirmPassword = value;
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(vertical: 16),
                child: PrimaryButton(
                  text: "ENVIAR",
                  onPressed: submit,
                  load: load
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}
