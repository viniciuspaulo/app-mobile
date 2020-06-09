import 'package:Clinicarx/app/components/buttons/primary_button.dart';
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
        Toast.show("Senhas não são iguais", context);
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
        Toast.show("Alterado com sucesso", context);
      } catch (mensagem) {
        Toast.show(mensagem, context);
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
                  onSaved: (String value) {}),
              Divider(color: Colors.transparent),
              TextFormField(
                  obscureText: !showPassword,
                  controller: password,
                  validator: (String _value) => validacaoStringNotNull(
                        valor: _value,
                        mensagem: "Senha é obrigatória",
                      ),
                  decoration: InputDecoration(
                    hintText: "Nova senha",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                    suffixIcon: IconButton(
                      icon: showPassword
                          ? Icon(FontAwesomeIcons.eyeSlash,
                              color: Colors.black54)
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
                    password.text = value;
                  }),
              Divider(color: Colors.transparent),
              TextFormField(
                obscureText: !showPasswordConfirm,
                controller: passwordConfirm,
                validator: (String _value) => validacaoStringNotNull(
                  valor: _value,
                  mensagem: "Senha é obrigatória",
                ),
                decoration: InputDecoration(
                  hintText: "Confirmar nova senha",
                  border: OutlineInputBorder(
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
                      setState(
                          () => showPasswordConfirm = !showPasswordConfirm);
                    },
                  ),
                ),
                onSaved: (String value) {
                  passwordConfirm.text = value;
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryButton(text: "Salvar", onPressed: submit, load: load),
              Divider(color: Colors.transparent)
            ],
          ),
        ),
      ),
    );
  }
}
