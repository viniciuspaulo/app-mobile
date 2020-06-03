

import 'package:flutter/material.dart';

class PerfilEditScreen extends StatefulWidget {
  static String tagRota = '/home/perfil-edit';
  static String tag = '/perfil-edit';
  final Key menuKey;

  const PerfilEditScreen({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PerfilEditScreenState();
}

class _PerfilEditScreenState extends State<PerfilEditScreen> {
  
    
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DADOS CADASTRAIS",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'CPF'
                        ),
                        onChanged: (String value) { },
                        onSaved: (String value) {},
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome completo'
                        ),
                        onChanged: (String value) { },
                        onSaved: (String value) {},
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Telefone'
                        ),
                        onChanged: (String value) { },
                        onSaved: (String value) {},
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Data de nascimento'
                        ),
                        onChanged: (String value) { },
                        onSaved: (String value) {},
                      ),

                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: Colors.transparent),
                          Text("Sexo" ),
                          Row(children: [
                              Checkbox(
                              value: true,
                              onChanged: (bool value) {},
                            ),
                            Text("Masculino"),

                            Checkbox(
                              value: false,
                              onChanged: (bool value) {},
                            ),
                            Text("Feminino"),
                          ])
                      ])

                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      )
    );
  }

}
