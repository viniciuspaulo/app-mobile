

import 'package:Clinicarx/app/modules/home/attendance/attendance_screen.dart';
import 'package:flutter/material.dart';

class CardAttendance extends StatelessWidget {

  CardAttendance();
  
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AttendanceScreen.tagRota);
      },
      child: Card(
        margin: const EdgeInsets.all(15.0),
        elevation: 5,
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
      ),
    );
  }
}