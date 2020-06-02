

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardAttendance extends StatelessWidget {

  CardAttendance();
  
  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  width: 80,
                  image: AssetImage('assets/images/paguemenos.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("20/05/2012 14:22"),
                    Text("30min51s")
                  ],
                )
              ],
            ),
            Divider(),
            Text("Farmacêutico(a): Juliana kiem"),
            Divider(height: 20,color: Colors.transparent,),
            Center(
              child: Text("Farmacêutico(a): Juliana kiem",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}