

import 'package:Clinicarx/app/components/cards/card_attendance.dart';
import 'package:Clinicarx/app/components/menu.dart';
import 'package:Clinicarx/app/repositorys/AttendanceRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AttendancesScreen extends StatefulWidget {
  static String tagRota = '/home/attendances';
  static String tag = '/attendances';
  final Key menuKey;

  const AttendancesScreen({Key key,this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AttendancesScreenState();
}

class _AttendancesScreenState extends State<AttendancesScreen> {
  
  AttendcePaginate attendancesPaginate = new AttendcePaginate();
  final repositorio = Modular.get<AttendanceRepository>();

  //Infity Scroll
  ScrollController _scrollController = new ScrollController();
  int page = 0;
  bool load = false;
  bool loadScroll = false;

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
    attendancesPaginate = await repositorio.getAttendences(page: page);
    setState(() => load = false);
  }

  scrollLoad() async {
    if(this.page >= attendancesPaginate.total) {
      setState(() => loadScroll = false);
      return;
    }
    if (!loadScroll) {
      setState(() => loadScroll = true);
      AttendcePaginate result = await repositorio.getAttendences(page: this.page++);
      attendancesPaginate.data = [...attendancesPaginate.data, ...result.data];
      setState(() => loadScroll = false);
    }
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
      ),
      drawer: Menu(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.teal.withAlpha(30),
            width: screenSize.width,
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PRÓXIMO ATENDIMENTO",
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 10
                  ),
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Icon(Icons.info_outline,
                        color: Colors.black54,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width - 150,
                      child: ListTile(
                        title: Text("NENHUM NOVO ATENDIMENTO AGENDADO",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text("Consulte seu farmacêutico"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    labelText: 'Buscar atendimentos',
                    fillColor: Colors.black54,
                    focusColor: Colors.black54
                  ),     
                  style: TextStyle(
                    color: Colors.black54
                  ),
                  onChanged: (String _value) {},   
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.search,
                  color: Colors.black54
                ),
              )
            ],
          ),

          Expanded(
            child: Container(
              child: this.load ? 
              Center(child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              )) : 
                attendancesPaginate.data.length > 0 ? 
                  ListView.builder(
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
                      return CardAttendance(attendancesPaginate.data[index]);
                    },
                  ) : 
                  Center(
                    child: Text("Não existe atendimentos"),
                  ),
            ),
          )
        ],
      )
    );
  }

}
