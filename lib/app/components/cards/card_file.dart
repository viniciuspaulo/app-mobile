import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:Clinicarx/app/modules/home/attendance/attendance_doc_screen.dart';
import 'package:toast/toast.dart';

class CardFile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () async {
        Toast.show("Aguarde por favor...", context,duration: Toast.LENGTH_LONG);
        try {
          final url = "http://africau.edu/images/default/sample.pdf";
          final filename = url.substring(url.lastIndexOf("/") + 1);
          var request = await HttpClient().getUrl(Uri.parse(url));
          var response = await request.close();
          var bytes = await consolidateHttpClientResponseBytes(response);
          String dir = (await getApplicationDocumentsDirectory()).path;
          File file = new File('$dir/$filename');
          await file.writeAsBytes(bytes);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AttendanceDocScreen(file.path, url)),
          );
        } catch(e) {
          Toast.show("Não foi possível exibir este pdf.", context,duration: Toast.LENGTH_LONG);
        }
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(FontAwesomeIcons.file),
          title: Text("Arquivo anexado"),
        ),
      ),
    );
  }
}