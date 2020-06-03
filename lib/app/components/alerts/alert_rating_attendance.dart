


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

modalAlertRatingAttendance({
  @required context
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
          height: screenSize.height / 2,
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
                Image(
                  width: 120,
                  image: AssetImage("assets/images/paguemenos.png",),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Farmacêutico(a)"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Mayara Lages"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(FontAwesomeIcons.star),
                    Icon(FontAwesomeIcons.star),
                    Icon(FontAwesomeIcons.star),
                    Icon(FontAwesomeIcons.star),
                    Icon(FontAwesomeIcons.star),
                ])
              ],
            ),
          ),
        );
    },
  );
}