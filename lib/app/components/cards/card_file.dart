import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:Clinicarx/app/components/global_scaffold.dart';
import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:Clinicarx/app/repositories/AttendanceRepository.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Clinicarx/app/modules/home/attendance/attendance_doc_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_extend/share_extend.dart';
import 'package:toast/toast.dart';
import 'package:path_provider/path_provider.dart';

class CardFile extends StatefulWidget {
  final AttendancesFilesModel attendenceFile;
  CardFile(this.attendenceFile);

  @override
  _CardFile createState() => _CardFile();
}

class _CardFile extends State<CardFile> {
  bool load = false;

  @override
  initState() {
    super.initState();
  }

  Future<File> saveFile() async {
    setState(() => load = true);

    try {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      final repositorio = Modular.get<AttendanceRepository>();
      var base64 =
          await repositorio.getAttendenceFileDetail(widget.attendenceFile);
      Uint8List bytes = base64Decode(base64);
      Directory downloadsDirectory =
          (await DownloadsPathProvider.downloadsDirectory);

      if (Platform.isIOS) {
        downloadsDirectory = await getApplicationDocumentsDirectory();
      }

      File file = new File(
          downloadsDirectory.path + '/' + widget.attendenceFile.id + ".pdf");

      await file.writeAsBytes(bytes.buffer.asUint8List());

      setState(() => load = false);
      return file;
    } catch (message) {
      setState(() => load = false);
      GlobalScaffold.instance.showSnackBarDanger(message);
      throw ("Erro");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(FontAwesomeIcons.fileAlt, color: Colors.teal),
      title: InkWell(
        onTap: () async {
          try {
            File file = await saveFile();
            Toast.show("Pdf salvo nos downloads.", context, gravity: 1);

            Future.delayed(Duration(seconds: 3), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AttendanceDocScreen(file.path, widget.attendenceFile)),
              );
            });
          } catch (e) {}
        },
        child: Text(
          widget.attendenceFile.name,
          style: TextStyle(color: Colors.teal),
        ),
      ),
      trailing: this.load
          ? SizedBox(
              width: 17,
              height: 17,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              ),
            )
          : InkWell(
              child: Icon(FontAwesomeIcons.shareAlt),
              onTap: () async {
                try {
                  File file = await saveFile();
                  ShareExtend.share(file.path, "Clinicarx");
                } catch (e) {
                  print(e);
                }
              },
            ),
    );
  }
}
