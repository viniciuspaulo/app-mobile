import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/input/primary_input.dart';
import 'package:Clinicarx/app/models/PhoneModel.dart';
import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:toast/toast.dart';

class PerfilInfoScreen extends StatefulWidget {
  final ProfileModel profile;
  PerfilInfoScreen(this.profile);

  @override
  State<StatefulWidget> createState() => _PerfilInfoScreenState();
}

class _PerfilInfoScreenState extends State<PerfilInfoScreen> {
  var maskCpf = new MaskedTextController(text: '', mask: '000.000.000-00');
  var maskPhone = new MaskedTextController(text: '', mask: '(00) 00000-0000');

  final repositorio = Modular.get<ClientRepository>();
  bool load = false;
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() => load = true);
      try {
        await repositorio.putProfile(widget.profile);
        setState(() => load = false);
        Toast.show('Atualizado com sucesso.', context);
      } catch (mensagem) {
        Toast.show(mensagem, context);
        setState(() => load = false);
      }
    }
  }

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      maskCpf.updateText(widget.profile.document);
      setState(() {
        if (widget.profile.birthday != null) {
          _date.text = widget.profile.birthday.format('dd/MM/yyyy');
        }
        if (widget.profile.phones.length > 0) {
          maskPhone.updateText(widget.profile.phones[0].phone);
        }
      });
    });
  }

  Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _date.value =
            TextEditingValue(text: DateFormat('dd/MM/yyyy').format(picked));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              Text(
                "DADOS CADASTRAIS",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                enable: false,
                mask: maskCpf,
                labelText: 'CPF',
                onChanged: (String value) {
                  widget.profile.document = value;
                },
                onSaved: (String value) {
                  widget.profile.document = value;
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                initialValue: widget.profile.name,
                labelText: 'Nome completo',
                onChanged: (String value) {
                  widget.profile.name = value;
                },
                onSaved: (String value) {
                  widget.profile.name = value;
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                labelText: 'Telefone',
                mask: maskPhone,
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  if (widget.profile.phones.length > 0) {
                    widget.profile.phones[0].phone = value;
                  } else {
                    PhoneModel phone = new PhoneModel();
                    phone.phone = value;
                    widget.profile.phones.add(phone);
                  }
                },
                onSaved: (String value) {
                  if (widget.profile.phones.length > 0) {
                    widget.profile.phones[0].phone = value;
                  } else {
                    PhoneModel phone = new PhoneModel();
                    phone.phone = value;
                    widget.profile.phones.add(phone);
                  }
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                enable: widget.profile != null ? false : true,
                labelText: 'Data de nascimento',
                mask: _date,
                keyboardType: TextInputType.datetime,
                onChanged: (String value) {
                  widget.profile.birthday = new Jiffy(dateParserUs(value));
                },
                onSaved: (String value) {
                  widget.profile.birthday = new Jiffy(dateParserUs(value));
                },
                suffixIcon: IconButton(
                  icon: Icon(FontAwesomeIcons.calendar, color: Colors.black54),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.transparent),
                  Text(
                    "Sexo",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 'male',
                          groupValue: widget.profile.sex,
                          onChanged: (String _value) {
                            setState(() {
                              widget.profile.sex = _value;
                            });
                          }),
                      Text(
                        "Masculino",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Radio(
                          value: 'female',
                          groupValue: widget.profile.sex,
                          onChanged: (String _value) {
                            setState(() {
                              widget.profile.sex = _value;
                            });
                          }),
                      Text(
                        "Feminino",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Divider(color: Colors.transparent),
              Text(
                "DADOS COMPLEMENTARES",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                initialValue: widget.profile.motherName,
                labelText: 'Nome da mãe',
                onChanged: (String value) {
                  widget.profile.motherName = value;
                },
                onSaved: (String value) {
                  widget.profile.motherName = value;
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                initialValue: widget.profile.skinColor,
                labelText: 'Raça / Cor da pele',
                onChanged: (String value) {
                  widget.profile.skinColor = value;
                },
                onSaved: (String value) {
                  widget.profile.skinColor = value;
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                initialValue: widget.profile.occupation,
                labelText: 'Ocupação',
                onChanged: (String value) {
                  widget.profile.occupation = value;
                },
                onSaved: (String value) {
                  widget.profile.occupation = value;
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                initialValue: widget.profile.birthCity,
                labelText: 'Cidade de nascimento',
                onChanged: (String value) {
                  widget.profile.birthCity = value;
                },
                onSaved: (String value) {
                  widget.profile.birthCity = value;
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                initialValue: widget.profile.birthState,
                labelText: 'Estado de nascimento',
                onChanged: (String value) {
                  widget.profile.birthState = value;
                },
                onSaved: (String value) {
                  widget.profile.birthState = value;
                },
              ),
              Divider(color: Colors.transparent),
              PrimaryInput(
                initialValue: widget.profile.birthCountry,
                labelText: 'Nacionalidade',
                onChanged: (String value) {
                  widget.profile.birthCountry = value;
                },
                onSaved: (String value) {
                  widget.profile.birthCountry = value;
                },
              ),
              Divider(color: Colors.transparent),
              ListTile(
                subtitle: Text(
                    "Aceito receber email com novidades sobre o Clinicarx"),
                leading: Checkbox(
                  value: widget.profile.newsletter,
                  onChanged: (bool _value) {
                    setState(() {
                      widget.profile.newsletter = _value;
                    });
                  },
                ),
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
