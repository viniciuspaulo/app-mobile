import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/input/primary_input.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/modules/home/home_sreen.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  static String tag = '/register';

  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final repositorio = Modular.get<ClientRepository>();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool load = false;
  bool showPassword = false;
  bool showPasswordConfirm = false;
  String loadSocial = "";
  bool autovalidate = false;
  UserModel _user = new UserModel();

  DateTime selectedDate = DateTime.now();
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  var maskNascimento = new MaskedTextController(text: '', mask: '00/00/0000');

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() => load = true);
      try {
        await repositorio.postRegister(_user);
        setState(() => load = false);
        Navigator.pushReplacementNamed(context, HomeScreen.tagRota);
      } catch (msg) {
        setState(() => load = false);
        Toast.show(msg, context);
        return;
      }
    }
  }

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      if (arguments != null) {
        print(arguments.name);
        setState(() {
          _user = arguments;
          _user.sex = 'male';
          _name.text = _user.name;
          _email.text = _user.email;
        });
      }
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        maskNascimento.updateText(
            TextEditingValue(text: DateFormat('dd/MM/yyyy').format(picked))
                .toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Form(
            key: this._formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 200,
                    height: 60,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      "Organizamos tudo para que você gerencie melhor sua saúde",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: _name,
                      validator: (String _value) => validacaoStringNotNull(
                        mensagem: "Nome é obrigatório",
                        valor: _value,
                      ),
                      decoration: InputDecoration(
                          hintText: "Nome completo",
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black45, width: 1.0),
                          )),
                      onChanged: (String value) {
                        _user.name = value;
                      },
                      onSaved: (String value) {
                        _user.name = value;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: _email,
                      validator: validacaoEmail,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black45, width: 1.0),
                        ),
                      ),
                      onChanged: (String value) {
                        _user.email = value;
                      },
                      onSaved: (String value) {
                        _user.email = value;
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: 'male',
                              groupValue: _user.sex,
                              onChanged: (String _value) {
                                setState(() {
                                  _user.sex = _value;
                                });
                              }),
                          Text(
                            "Masculino",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                          Radio(
                              value: 'female',
                              groupValue: _user.sex,
                              onChanged: (String _value) {
                                setState(() {
                                  _user.sex = _value;
                                });
                              }),
                          Text(
                            "Feminino",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  TextFormField(
                    controller: maskNascimento,
                    validator: (String _value) => validacaoStringNotNull(
                      mensagem: "Data de nascimento é obrigatório",
                      valor: _value,
                    ),
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        hintText: "Data de nascimento",
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black45, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 1.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(FontAwesomeIcons.calendar,
                              color: Colors.black45),
                          onPressed: () {
                            _selectDate(context);
                          },
                        )),
                    onChanged: (String value) {
                      _user.birthday = value;
                    },
                    onSaved: (String value) {
                      _user.birthday = value;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: PrimaryButton(
                        text: "CONFIRMAR", onPressed: submit, load: load),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
