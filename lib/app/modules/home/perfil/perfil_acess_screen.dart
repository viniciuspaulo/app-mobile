import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/input/primary_input.dart';
import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class PerfilAcessScreen extends StatefulWidget {
  final ProfileModel profile;
  PerfilAcessScreen(this.profile);

  @override
  State<StatefulWidget> createState() => _PerfilAcessScreenState();
}

class _PerfilAcessScreenState extends State<PerfilAcessScreen> {
  final repositorio = Modular.get<ClientRepository>();
  bool load = false;
  bool showPassword = false;
  bool showPasswordConfirm = false;
  String password = "";
  String passwordConfirm = "";

  submit() async {
    if (password != passwordConfirm) {
      Toast.show("Senhas não são iguais", context);
      return;
    }
    setState(() => load = true);
    try {
      await repositorio.putProfilePassword(password);
      setState(() {
        password = "";
        passwordConfirm = "";
        load = false;
      });
      Toast.show("Alterado com sucesso", context);
    } catch (mensagem) {
      print(mensagem);
      Toast.show(mensagem, context);
      setState(() => load = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              "DADOS DE ACESSO",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Divider(color: Colors.transparent),
            PrimaryInput(
                enable: false,
                initialValue: widget.profile.email,
                labelText: 'Email',
                onChanged: (String value) {},
                onSaved: (String value) {}),
            Divider(color: Colors.transparent),
            TextFormField(
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
                password = value;
              },
              onChanged: (String value) {
                password = value;
              },
            ),
            Divider(color: Colors.transparent),
            TextFormField(
              obscureText: !showPasswordConfirm,
              validator: (String _value) => validacaoStringNotNull(
                valor: _value,
                mensagem: "Senha é obrigatória",
              ),
              decoration: InputDecoration(
                hintText: "Confirmar nova senha",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1.0),
                ),
                suffixIcon: IconButton(
                  icon: showPasswordConfirm
                      ? Icon(FontAwesomeIcons.eyeSlash, color: Colors.black54)
                      : Icon(
                          FontAwesomeIcons.eye,
                          color: Colors.black54,
                        ),
                  onPressed: () {
                    setState(() => showPasswordConfirm = !showPasswordConfirm);
                  },
                ),
              ),
              onSaved: (String value) {
                passwordConfirm = value;
              },
              onChanged: (String value) {
                passwordConfirm = value;
              },
            ),
            Divider(color: Colors.transparent),
            PrimaryButton(text: "Salvar", onPressed: submit, load: load),
            Divider(color: Colors.transparent)
          ],
        ),
      ),
    );
  }
}
