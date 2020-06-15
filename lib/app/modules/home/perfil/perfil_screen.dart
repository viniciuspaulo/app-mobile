import 'package:Clinicarx/app/components/menu.dart';
import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_edit_screen.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PerfilScreen extends StatefulWidget {
  static String tagRota = '/home/perfil';
  static String tag = '/perfil';
  final Key menuKey;

  const PerfilScreen({Key key, this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  ProfileModel profile = new ProfileModel();
  final repositorio = Modular.get<ClientRepository>();
  bool load = false;

  var maskCpf = new MaskedTextController(text: '', mask: '000.000.000-00');

  @override
  initState() {
    super.initState();
    onInit();
  }

  onInit() async {
    setState(() => load = true);
    profile = await repositorio.getProfile();
    maskCpf.updateText(profile.document);
    setState(() => load = false);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Image(
          width: 120,
          image: AssetImage(
            "assets/images/logo.png",
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      backgroundColor: Colors.white,
      drawer: Menu(),
      body: this.load
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            ))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Image(
                                width: 120,
                                image: AssetImage(
                                  "assets/images/avatar.png",
                                ),
                              ),
                            ),
                            Text(
                              profile.name.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                maskCpf.text,
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Text(
                              profile.email,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                (profile.sex == "male"
                                        ? "Masculino"
                                        : "Feminino") +
                                    " | " +
                                    (getAge(profile.birthday)) +
                                    " anos",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PerfilEditScreen.tagRota,
                                    arguments: profile);
                              },
                              child: Text(
                                "Editar Perfil",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.teal),
                              ),
                            ),
                            Divider(),
                            Row(children: [
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Text(
                                          profile.amountMedicines.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Medicamentos em uso",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Text(
                                          profile.amountAttendances.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Número de atendimentos",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "Últimas farmacias visitadas",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              children: profile.lastClinicAttendances.map(
                                (clinics) {
                                  return Column(
                                    children: [
                                      Container(
                                          child: ListTile(
                                        leading: imageFromBase64String(
                                            base64String: clinics.logo,
                                            width: 80,
                                            height: 40),
                                        title: Text(clinics.name),
                                        subtitle: Text(clinics.phone),
                                      )),
                                      Divider()
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
