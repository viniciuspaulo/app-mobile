


import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

modalAlertRatingAttendance({
  @required context,
  @required AttendancesModel attendance,
  @required dynamic onPress,
}) {
  showModalBottomSheet(
    context:  context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30)
      ),
    ),
    builder:  (BuildContext context) {
        
        final Size screenSize = MediaQuery.of(context).size;

        return Container(
          width: screenSize.width,
          height: screenSize.height - 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            ),
            color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Avaliação"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Como foi seu atendimento de saúde na Farmácia(a)"),
                ),
                
                imageFromBase64String(
                  base64String: attendance.logo,
                  width: 100,
                  height: 100
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Farmacêutico(a)"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(attendance.farmaceutico),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(child: Icon(FontAwesomeIcons.star),
                        onTap: () {
                          onPress(1);
                          Navigator.pop(context);
                        },
                      ),
                      InkWell(child: Icon(FontAwesomeIcons.star),
                        onTap: () {
                          onPress(2);
                          Navigator.pop(context);
                        },
                      ),
                      InkWell(child: Icon(FontAwesomeIcons.star),
                        onTap: () {
                          onPress(3);
                          Navigator.pop(context);
                        },
                      ),
                      InkWell(child: Icon(FontAwesomeIcons.star),
                        onTap: () {
                          onPress(4);
                          Navigator.pop(context);
                        },
                      ),
                      InkWell(child: Icon(FontAwesomeIcons.star),
                        onTap: () {
                          onPress(5);
                          Navigator.pop(context);
                        },
                      ),
                  ]),
                )
              ],
            ),
          ),
        );
    },
  );
}