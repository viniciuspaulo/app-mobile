

import 'package:flutter/material.dart';

class MedicamentScreen extends StatefulWidget {
  static String tagRota = '/home/medicament';
  static String tag = '/medicament';
  final Key menuKey;

  const MedicamentScreen({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicamentScreenState();
}

class _MedicamentScreenState extends State<MedicamentScreen> {
  
    
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
      body: Column(
        children: [
          Text("Perfil")
        ],
      )
    );
  }

}
