
import 'package:Clinicarx/app/components/alerts/alert_rating_attendance.dart';
import 'package:Clinicarx/app/components/cards/card_file.dart';
import 'package:Clinicarx/app/components/cards/card_procedure.dart';
import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:Clinicarx/app/repositorys/AttendanceRepository.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

class AttendanceScreen extends StatefulWidget {
  static String tagRota = '/home/attendance';
  static String tag = '/attendance';
  final Key menuKey;

  const AttendanceScreen({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  
  AttendancesModel attendance = new AttendancesModel();
  final repositorio = Modular.get<AttendanceRepository>();
  bool load = false;

  @override
  initState() {
    Future.delayed(Duration.zero,(){
      attendance = ModalRoute.of(context).settings.arguments;
      onInit();
    });
    super.initState();
  }


  onInit() async {
    setState(() => load = true);
    attendance = await repositorio.getAttendenceId(attendance);
    setState(() => load = false);
  }

  ratingPress(int rating) async {
    setState(() {
      this.attendance.rating = rating;
    });
    await repositorio.getAttendenceRating(this.attendance);
  }

    
  @override
  Widget build(BuildContext context) {  

    final Size screenSize = MediaQuery.of(context).size;
      
    return Scaffold(
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
              child: this.attendance.rating == null ? Icon(FontAwesomeIcons.star) : Icon(FontAwesomeIcons.solidStar),
              onTap: () {
                if (this.attendance.rating == null) {
                  modalAlertRatingAttendance(
                    context: context,
                    attendance: this.attendance,
                    onPress: ratingPress
                  );
                } else {
                  Toast.show("O atendimento já foi avaliado", context);
                }
              },
            ),
          )
        ],
      ),
      backgroundColor: hexToColor("#eff0f1"),
      body: this.load? 
        Center(child: CircularProgressIndicator(
          strokeWidth: 1,
        )) :
        SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: screenSize.width,
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    this.attendance.logo != null ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: imageFromBase64String(
                        base64String: this.attendance.logo,
                        width: 80
                      ),
                    ) : Text(""),
                    Text(this.attendance.farmaciaName != null ? this.attendance.farmaciaName : "")
                ]),
              ),

              Container(
                width: screenSize.width,
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(this.attendance.farmaciaPhone != null ? this.attendance.farmaciaPhone : "",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                width: screenSize.width,
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),

              Container(
                width: screenSize.width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text("Farmacêutico(a): ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(attendance.farmaceutico != null ? attendance.farmaceutico : ""),
                  trailing: Column(
                    children: [
                      Text(attendance.closedTime != null ? attendance.closedTime : ""),
                      Text(attendance.duration != null ? attendance.duration : ""),
                    ],
                  ),
                ),
              ),

              Container(
                width: screenSize.width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text("Cargo: ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(attendance.farmaceuticoCargo !=null ? attendance.farmaceuticoCargo : ""),
                ),
              ),

              Divider(color: Colors.transparent),
              Text("PROCEDIMENTOS REALIZADOS",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                ),
              ),

              Column(
                children: attendance.procedures != null ? attendance.procedures.map((procedure) {
                  return CardProcedure(procedure);
                }).toList() : [],
              ),


              Divider(color: Colors.transparent),
              Text("ANEXOS DO ATENDIMENTO",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                )
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: attendance.files != null ? attendance.files.map((file) {
                      return CardFile(file);
                    }).toList() : [],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

}
