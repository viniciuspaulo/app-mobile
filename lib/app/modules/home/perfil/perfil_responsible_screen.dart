import 'package:Clinicarx/app/components/alerts/alert_responsibles.dart';
import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/models/ResponsiblesModel.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

class PerfilResponsibleScreen extends StatefulWidget {
  final ProfileModel profile;
  PerfilResponsibleScreen(this.profile);

  @override
  State<StatefulWidget> createState() => _PerfilResponsibleScreenState();
}

class _PerfilResponsibleScreenState extends State<PerfilResponsibleScreen> {
  final repositorio = Modular.get<ClientRepository>();
  bool loading = false;

  submit(ResponsiblesModel responsible) async {
    setState(() => loading = true);
    try {
      await repositorio.putResponsibles(responsible);
      setState(() {
        loading = false;
        widget.profile.responsibles.add(responsible);
      });
      Toast.show("Adiciona com sucesso", context);
    } catch (mensagem) {
      print(mensagem);
      Toast.show(mensagem, context);
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Card(
      child: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              "RESPONSÁVEL, CUIDADOR, PROFISSIONAL DA SAÚDE",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Divider(color: Colors.transparent),
            Row(children: [
              FloatingActionButton(
                onPressed: () {
                  modalAlertResponsibles(context: context, onPress: submit);
                },
                child: Icon(Icons.add),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Adione um contato"),
              ),
            ]),
            Column(
              children: widget.profile.responsibles != null
                  ? widget.profile.responsibles.map((responsible) {
                      return Container(
                        width: screenSize.width,
                        child: Container(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(children: [
                            Text(responsible.name),
                            Text(responsible.email),
                            Text(
                              responsible.phone1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            Divider(),
                          ]),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          ],
        ),
      ),
    );
  }
}
