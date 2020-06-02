

import 'package:Clinicarx/app/components/cards/cardAttendance.dart';
import 'package:Clinicarx/app/components/cards/cardMedicament.dart';
import 'package:Clinicarx/app/components/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicamentPage extends StatefulWidget {
  static String tagRota = '/home/medicament';
  static String tag = '/medicament';
  final Key menuKey;

  const MedicamentPage({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MedicamentPageState();
}

class _MedicamentPageState extends State<MedicamentPage> {
  
    
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    labelText: 'Buscar medicamentos',
                    fillColor: Colors.black54,
                    focusColor: Colors.black54
                  ),     
                  style: TextStyle(
                    color: Colors.black54
                  ),
                  onChanged: (String _value) {},   
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.search,
                  color: Colors.black54
                ),
              )
            ],
          ),

          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: 21,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {  
                return CardMedicament();
                },
              ),
            ),
          )
        ],
      )
    );
  }

}
