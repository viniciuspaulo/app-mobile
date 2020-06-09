import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:Clinicarx/app/modules/home/attendance/attendance_screen.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';

class CardAttendance extends StatelessWidget {
  final AttendancesModel attendance;
  CardAttendance(this.attendance);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AttendanceScreen.tagRota,
            arguments: attendance);
      },
      child: Card(
        margin: const EdgeInsets.all(5.0),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  attendance != null && attendance.logo != null
                      ? imageFromBase64String(
                          base64String: attendance.logo, width: 80, height: 40)
                      : Text(''),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(attendance.closedTime),
                      Text(attendance.duration)
                    ],
                  )
                ],
              ),
              Divider(),
              Text("Farmacia: " + attendance.farmaciaName),
              Divider(
                height: 20,
                color: Colors.transparent,
              ),
              Center(
                child: Text(
                  "Farmacêutico(a): " + attendance.farmaceutico,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
