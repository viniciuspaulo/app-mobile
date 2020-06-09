import 'package:Clinicarx/app/components/buttons/secondary_button.dart';
import 'package:Clinicarx/app/models/AppointmentsModel.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

modalAlertAppointmentAttendance(
    {@required context, @required AppointmentsModel appointment}) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    ),
    builder: (BuildContext context) {
      final Size screenSize = MediaQuery.of(context).size;

      return Container(
        width: screenSize.width,
        height: screenSize.height - 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.infoCircle,
                    size: 50, color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Seu atendimento está agendado para:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(appointment.scheduledStartAt),
              ),
              ListTile(
                leading: appointment != null && appointment.logo != null
                    ? imageFromBase64String(
                        base64String: appointment.logo,
                        width: 80,
                        height: 40,
                      )
                    : null,
                title: Text(appointment.name),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(appointment.phone != null ? appointment.phone : ''),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: SecundaryButton(
                  text: "OK, ENTENDI",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
