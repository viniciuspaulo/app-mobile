

import 'package:Clinicarx/app/components/menu.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PerfilScreen extends StatefulWidget {
  static String tagRota = '/home/perfil';
  static String tag = '/perfil';
  final Key menuKey;

  const PerfilScreen({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  
    
  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: Image(
          width: 120,
          image: AssetImage("assets/images/logo.png",),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black54
        ),
      ),
      backgroundColor: Colors.white,
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                width: 120,
                image: AssetImage("assets/images/avatar.png",),
              ),
              Text("TESTE APP MOBILE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black54
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("782.226.620-90"),
              ),
              Text("vbbritodepaulo@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Marculino | 30 anos"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PerfilEditScreen.tagRota);
                },
                child: Text("Editar Perfil",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.teal
                  ),
                ),
              ),
              Divider(),

              Row(children: [
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Text("2",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.teal
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Medicamentos em uso"),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Text("3072",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.teal
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Número de atendimentos"),
                        ),
                      ],
                    ),
                  ),
                )
              ]),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Últimas farmacias visitadas"),
              ),

              Column(
                children: [1,2,3].map((e) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading:  Image(
                        width: 50,
                        image: AssetImage('assets/images/paguemenos.png'),
                      ),
                      title: Text("Loja 33"),
                    )
                  );
                }).toList(),
              )
              
            ],
          ),
        ),
      )
    );
  }

}
