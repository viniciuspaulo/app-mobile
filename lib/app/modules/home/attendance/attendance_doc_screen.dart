import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class AttendanceDocScreen extends StatefulWidget {
  final AttendancesFilesModel attendenceFile;
  final String pathPDF;
  AttendanceDocScreen(this.pathPDF, this.attendenceFile);

  @override
  _AttendanceDocScreenState createState() => _AttendanceDocScreenState();
}

class _AttendanceDocScreenState extends State<AttendanceDocScreen> {
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
            title: Center(
              child: Image(
                width: 100,
                image: AssetImage(
                  "assets/images/logo@2x.png",
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black54)),
        path: widget.pathPDF);
  }
}
