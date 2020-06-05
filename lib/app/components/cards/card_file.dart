
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:Clinicarx/app/repositorys/AttendanceRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:Clinicarx/app/modules/home/attendance/attendance_doc_screen.dart';
import 'package:toast/toast.dart';


class CardFile extends StatelessWidget {

  final AttendancesFilesModel attendenceFile;
  CardFile(this.attendenceFile);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () async {

        Toast.show("Este pdf foi salvo no seu dispositivo.", context, duration: Toast.LENGTH_LONG);

        final repositorio = Modular.get<AttendanceRepository>();
        var base64 = await repositorio.getAttendenceFileDetail(attendenceFile);

        try {
          
          Uint8List bytes = base64Decode(base64);
          String dir = (await getApplicationDocumentsDirectory()).path;
          File file = new File('$dir/'+attendenceFile.id+".pdf");
          await file.writeAsBytes(bytes.buffer.asUint8List());

           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AttendanceDocScreen(file.path)),
          );
        } catch(e) {
          Toast.show("Não foi possível exibir este pdf.", context,duration: Toast.LENGTH_LONG);
        }
      },
      child: ListTile(
        leading: Icon(FontAwesomeIcons.fileAlt, color: Colors.teal),
        title: Text(attendenceFile.name,
          style: TextStyle(
            color: Colors.teal
          ),
        ),
      ),
    );
  }
}