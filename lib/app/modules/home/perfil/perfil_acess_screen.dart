import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/buttons/secondary_button.dart';
import 'package:Clinicarx/app/components/input/primary_input.dart';
import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  TextEditingController password = new TextEditingController();
  TextEditingController passwordConfirm = new TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (password.text != passwordConfirm.text) {
        Toast.show("Senhas não são iguais", context, gravity: 1);
        return;
      }
      setState(() => load = true);
      try {
        await repositorio.putProfilePassword(password.text);
        setState(() {
          password.clear();
          passwordConfirm.clear();
          load = false;
        });
        Toast.show("Alterado com sucesso", context, gravity: 1);
      } catch (mensagem) {
        Toast.show(mensagem, context, gravity: 1);
        setState(() => load = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
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
                onSaved: (String value) {},
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                labelText: 'Nova senha',
                validator: (String _value) {
                  validacaoStringNotNull(
                      valor: _value, mensagem: "Senha é obrigatória");
                },
                mask: password,
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  icon: showPassword
                      ? Icon(FontAwesomeIcons.eye, color: Colors.black54)
                      : Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: Colors.black54,
                        ),
                  onPressed: () => setState(() => showPassword = !showPassword),
                ),
                onChanged: (String value) {},
                onSaved: (String value) {
                  password.text = value;
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                labelText: 'Confirmar nova senha',
                validator: (String _value) {
                  validacaoStringNotNull(
                      valor: _value, mensagem: "Senha é obrigatória");
                },
                mask: password,
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  icon: showPassword
                      ? Icon(FontAwesomeIcons.eye, color: Colors.black54)
                      : Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: Colors.black54,
                        ),
                  onPressed: () => setState(
                      () => showPasswordConfirm = !showPasswordConfirm),
                ),
                onChanged: (String value) {},
                onSaved: (String value) {
                  passwordConfirm.text = value;
                },
              ),
              Divider(color: Colors.transparent),
              SecondaryButton(text: "Salvar", onPressed: submit, load: load),
              Divider(color: Colors.transparent)
            ],
          ),
        ),
      ),
    );
  }
}
