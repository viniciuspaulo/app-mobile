import 'package:Clinicarx/app/components/alerts/alert_appointment_attendance.dart';
import 'package:Clinicarx/app/models/AppointmentsModel.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';

class CardAttendanceTreatment extends StatelessWidget {
  final AppointmentsModel appointment;
  final bool load;
  CardAttendanceTreatment(this.appointment, this.load);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    print(appointment);

    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.teal.withAlpha(30),
      width: screenSize.width,
      height: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PRÓXIMO ATENDIMENTO",
            style: TextStyle(
                color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 10),
          ),
          this.load
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 1,
                ))
              : appointment != null && appointment.scheduledStartAt != null
                  ? Card(
                      child: ListTile(
                        onTap: () {
                          modalAlertAppointmentAttendance(
                              context: context, appointment: appointment);
                        },
                        leading: appointment != null && appointment.logo != null
                            ? imageFromBase64String(
                                base64String: appointment.logo,
                                width: 80,
                                height: 40,
                              )
                            : null,
                        title: Text(
                          appointment != null
                              ? appointment.scheduledStartAt.split(' ')[0]
                              : '',
                        ),
                        subtitle: Text(
                          appointment != null
                              ? appointment.scheduledStartAt.split(' ')[1]
                              : '',
                        ),
                        trailing: Text(
                          'ver detalhes',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.black54,
                            size: 60,
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width - 150,
                          child: ListTile(
                            title: Text(
                              "NENHUM NOVO ATENDIMENTO AGENDADO",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Consulte seu farmacêutico"),
                          ),
                        )
                      ],
                    )
        ],
      ),
    );
  }
}
