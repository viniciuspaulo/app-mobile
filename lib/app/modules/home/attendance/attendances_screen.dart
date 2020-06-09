import 'package:Clinicarx/app/components/cards/card_attendance.dart';
import 'package:Clinicarx/app/components/cards/card_attendance_tratament.dart';
import 'package:Clinicarx/app/components/menu.dart';
import 'package:Clinicarx/app/models/AppointmentsModel.dart';
import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:Clinicarx/app/repositories/AppointmentsRepository.dart';
import 'package:Clinicarx/app/repositories/AttendanceRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AttendancesScreen extends StatefulWidget {
  static String tagRota = '/home/attendances';
  static String tag = '/attendances';
  final Key menuKey;

  const AttendancesScreen({Key key, this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AttendancesScreenState();
}

class _AttendancesScreenState extends State<AttendancesScreen> {
  AttendcePaginate attendancesPaginate = new AttendcePaginate();
  final repositorio = Modular.get<AttendanceRepository>();
  final repositorioAppontments = Modular.get<AppointmentsRepository>();

  List<AttendancesModel> searchList = [];
  List<AppointmentsModel> appointments = [];

  //Infity Scroll
  ScrollController _scrollController = new ScrollController();
  int page = 0;
  bool load = false;
  bool loadScroll = false;

  bool loadAppointments = false;

  @override
  initState() {
    super.initState();
    onInit();

    _scrollController.addListener(() {
      var triggerFetchMoreSize =
          0.9 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        scrollLoad();
      }
    });
  }

  onInit() async {
    setState(() => load = true);
    loadAppointment();
    searchList = [];
    attendancesPaginate = await repositorio.getAttendences(page: page);
    searchList = attendancesPaginate.data;
    setState(() => load = false);
  }

  loadAppointment() async {
    setState(() => loadAppointments = true);
    appointments = await repositorioAppontments.getAppointments();
    setState(() => loadAppointments = false);
  }

  scrollLoad() async {
    if (this.page >= attendancesPaginate.total) {
      setState(() => loadScroll = false);
      return;
    }
    if (!loadScroll) {
      setState(() => loadScroll = true);
      searchList = [];
      AttendcePaginate result =
          await repositorio.getAttendences(page: this.page++);
      attendancesPaginate.data = [...attendancesPaginate.data, ...result.data];
      searchList = attendancesPaginate.data;
      setState(() => loadScroll = false);
    }
  }

  search(String text) {
    attendancesPaginate.data = searchList
        .where((item) =>
            item.farmaciaName.toUpperCase().contains(text.toUpperCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Image(
            width: 120,
            image: AssetImage(
              "assets/images/logo.png",
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
        ),
        drawer: Menu(),
        body: Column(
          children: [
            CardAttendanceTratament(
                appointments.length > 0 ? appointments[0] : null,
                loadAppointments),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        labelText: 'Buscar atendimentos',
                        fillColor: Colors.black54,
                        focusColor: Colors.black54),
                    style: TextStyle(color: Colors.black54),
                    onChanged: search,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.search, color: Colors.black54),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: this.load
                    ? Center(
                        child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 1,
                      ))
                    : attendancesPaginate.data.length > 0
                        ? ListView.builder(
                            controller: _scrollController,
                            itemCount: attendancesPaginate.data.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              // if (loadScroll && index == attendancesPaginate.data.length) {
                              //   return Center(child: CircularProgressIndicator(
                              //     backgroundColor: Colors.white,
                              //     strokeWidth: 1,
                              //   ));
                              // }
                              return CardAttendance(
                                  attendancesPaginate.data[index]);
                            },
                          )
                        : Center(
                            child: Text("Não existe atendimentos"),
                          ),
              ),
            )
          ],
        ));
  }
}
