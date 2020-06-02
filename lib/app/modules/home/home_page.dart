
import 'package:Clinicarx/app/components/menu.dart';
import 'package:Clinicarx/app/modules/home/inicio/attendancePage.dart';
import 'package:Clinicarx/app/modules/home/inicio/medicamentPage.dart';
import 'package:Clinicarx/app/modules/home/inicio/perfilPage.dart';
import 'package:Clinicarx/env.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static String tag = '/home-tab';
  static String tagRota = '/home/home-tab';
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    AttendancePage(),
    MedicamentPage(),
    PerfilPage()
  ];

  void onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: environment['cor1'],
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
         BottomNavigationBarItem(
            icon: Image(
              width: 35,
              height: 35,
              image: AssetImage("assets/images/icon_atend.png",),
            ),
            title: Text('Atendimentos',style: TextStyle(color: Colors.white)),
         ),
         BottomNavigationBarItem(
            icon: Image(
              width: 35,
              height: 35,
              image: AssetImage("assets/images/ICON_CAPSULE.png",),
            ),
            title: Text('Medicamentos',style: TextStyle(color: Colors.white)),
         ),
         BottomNavigationBarItem(
            icon: Image(
            width: 35,
              height: 35,
              image: AssetImage("assets/images/ICON_USER.png",),
            ),
           title: Text('Perfil',style: TextStyle(color: Colors.white)),
         ),
       ],
      )
    );
  }
}
