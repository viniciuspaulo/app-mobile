import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/input/primary_input.dart';
import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class PerfilInfoScreen extends StatefulWidget {
  final ProfileModel profile;
  PerfilInfoScreen(this.profile);

  @override
  State<StatefulWidget> createState() => _PerfilInfoScreenState();
}

class _PerfilInfoScreenState extends State<PerfilInfoScreen> {
  var maskCpf = new MaskedTextController(text: '', mask: '000.000.000-00');
  final repositorio = Modular.get<ClientRepository>();
  bool load = false;

  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  submit() async {
    setState(() => load = true);
    try {
      await repositorio.putProfile(widget.profile);
      setState(() => load = false);
    } catch (mensagem) {
      Toast.show(mensagem, context);
      setState(() => load = false);
    }
  }

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      maskCpf.updateText(widget.profile.document);
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
        _date.value =
            TextEditingValue(text: DateFormat('dd/MM/yyyy').format(picked));
      });
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
              "DADOS CADASTRAIS",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Divider(color: Colors.transparent),
            TextFormField(
                enabled: false,
                controller: maskCpf,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
                  ),
                )),
            Divider(color: Colors.transparent),
            PrimaryInput(
                initialValue: widget.profile.name,
                labelText: 'Nome completo',
                onChanged: (String value) {
                  widget.profile.name = value;
                },
                onSaved: (String value) {
                  widget.profile.name = value;
                }),
            Divider(color: Colors.transparent),
            PrimaryInput(
              labelText: 'Telefone',
              onChanged: (String value) {},
              onSaved: (String value) {},
            ),
            Divider(color: Colors.transparent),
            TextFormField(
              controller: _date,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  hintText: "Data de nascimento",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.0),
                  ),
                  suffixIcon: IconButton(
                    icon:
                        Icon(FontAwesomeIcons.calendar, color: Colors.black54),
                    onPressed: () {
                      _selectDate(context);
                    },
                  )),
              onChanged: (String value) {
                // widget.profile.birthday = value;
              },
              onSaved: (String value) {
                // widget.profile.birthday = value;
              },
            ),
            Divider(color: Colors.transparent),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Divider(color: Colors.transparent),
              Text("Sexo"),
              Row(children: [
                Radio(
                    value: 'male',
                    groupValue: widget.profile.sex,
                    onChanged: (String _value) {
                      setState(() {
                        widget.profile.sex = _value;
                      });
                    }),
                Text("Masculino"),
                Radio(
                    value: 'female',
                    groupValue: widget.profile.sex,
                    onChanged: (String _value) {
                      setState(() {
                        widget.profile.sex = _value;
                      });
                    }),
                Text("Feminino"),
              ])
            ]),
            Divider(color: Colors.transparent),
            Text(
              "DADOS COMPLEMENTARES",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
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
              subtitle:
                  Text("Aceito receber email com novidades sobre o Clinicarx"),
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
    );
  }
}
