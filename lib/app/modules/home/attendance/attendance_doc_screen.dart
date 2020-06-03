
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';


class AttendanceDocScreen extends StatelessWidget{

  String pathPDF = "";
  String urlPDF = "";
  AttendanceDocScreen(this.pathPDF, this.urlPDF);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Image(
          width: 120,
          image: AssetImage("assets/images/logo.png",),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black54
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(FontAwesomeIcons.shareAlt),
              onTap: () {
                Share.share(this.urlPDF);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(FontAwesomeIcons.fileDownload),
              onTap: () { 
                Toast.show("Pdf salvo.", context);
              },
            ),
          )
        ],
      ),
      path: pathPDF);
  }

}

