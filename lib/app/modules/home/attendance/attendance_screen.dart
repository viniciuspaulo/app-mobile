
import 'package:Clinicarx/app/components/alerts/alert_rating_attendance.dart';
import 'package:Clinicarx/app/components/cards/card_file.dart';
import 'package:Clinicarx/app/components/cards/card_procedure.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AttendanceScreen extends StatefulWidget {
  static String tagRota = '/home/attendance';
  static String tag = '/attendance';
  final Key menuKey;

  const AttendanceScreen({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  
    
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(FontAwesomeIcons.star),
              onTap: () {
                modalAlertRatingAttendance(
                  context: context
                );
              },
            ),
          )
        ],
      ),
      backgroundColor: hexToColor("#eff0f1"),
      body: Column(
        children: [
         
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 80,
                      image: AssetImage("assets/images/paguemenos.png",),
                    ),
                    Text("Pague Menos")
                  ],
                ),
                Text("(14) 3458-7890"),
                Divider(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Pague Menos"),
                          Text("Pague Menos"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Pague Menos"),
                          Text("Pague Menos"),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Divider(color: Colors.transparent),
                  Text("PROCEDIMENTOS REALIZADOS"),

                  Column(
                    children: [1,2,3].map((e) {
                      return CardProcedure();
                    }).toList(),
                  ),


                  Divider(color: Colors.transparent),
                  Text("ANEXOS DO ATENDIMENTO"),

                  Column(
                    children: [1,2,3].map((e) {
                      return CardFile();
                    }).toList(),
                  )

                ],
              ),
            ),
          )
        ],
      )
    );
  }

}
