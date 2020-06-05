import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/buttons/secondary_button.dart';
import 'package:Clinicarx/app/modules/auth/remember/password_screen.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class ResetScreen extends StatefulWidget {
  static String tagRota = '/reset';
  static String tag = '/reset';

  const ResetScreen({Key key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  ClientRepository _repositorio = new ClientRepository();
  bool load = false;
  String token = "";
  String code = "";

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() => load = true);

      try {
        print(code);

        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", token);

        var result = await _repositorio.postValidateResetPassword(code);

        setState(() => load = false);
        prefs.remove("token");

        Navigator.pushNamed(context, PasswordScreen.tag,
            arguments: result['token']);
      } catch (mensagem) {
        Toast.show(mensagem, context);
        setState(() => load = false);
      }
    }
  }

  @override
  initState() {
    Future.delayed(Duration.zero, () {
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
                  image: AssetImage("assets/images/logo.png"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "Se houver uma conta vinculada a esse e-mail você receberá um código para alterar sua senha.",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Código",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 1.0),
                      ),
                    ),
                    onSaved: (String value) {
                      code = value;
                    },
                    onChanged: (String value) {
                      code = value;
                    },
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: PrimaryButton(
                        text: "VALIDAR CÓDIGO", onPressed: submit, load: load)),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: SecundaryButton(
                      text: "REENVIAR E-MAIL",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
