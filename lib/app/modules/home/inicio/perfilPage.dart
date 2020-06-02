

import 'package:Clinicarx/app/components/menu.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  static String tagRota = '/home/perfil';
  static String tag = '/perfil';
  final Key menuKey;

  const PerfilPage({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  
    
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
      drawer: Menu(),
      body: Column(
        children: [
          Text("Perfil")
        ],
      )
    );
  }

}
