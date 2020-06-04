
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';


class AttendanceDocScreen extends StatefulWidget{

  final String pathPDF;
  AttendanceDocScreen(this.pathPDF);

  @override
  _AttendanceDocScreenState createState() => _AttendanceDocScreenState();
}

class _AttendanceDocScreenState extends State<AttendanceDocScreen> {

  salvarArquivo() { 
    Toast.show("Pdf salvo.", context);
  }

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
                Share.share(widget.pathPDF);
              },
            ),
          )
        ],
      ),
      path: widget.pathPDF);
  }
}

