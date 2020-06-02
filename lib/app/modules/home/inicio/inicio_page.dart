
import 'dart:io';

import 'package:Clinicarx/app/components/menu.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  static String tagRota = '/home/inicio';
  static String tag = '/inicio';
  final Key menuKey;

  const InicioPage({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  
    
  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      drawer: Menu(),
      body: Text("inicio")
    );
  }

}
