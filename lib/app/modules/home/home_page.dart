
import 'package:Clinicarx/app/components/menu.dart';
import 'package:Clinicarx/app/modules/home/inicio/inicio_page.dart';
import 'package:Clinicarx/env.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final String title;
  static String tag = '/home-tab';
  static String tagRota = '/home/home-tab';
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    InicioPage(),
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
       onTap: onTabTapped,
       currentIndex: _currentIndex,
       items: [
         BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.home,
            color: _currentIndex == 0 ? environment['cor1'] : Colors.black54,
           ),
           title: Text('Início',style: TextStyle(color: environment['cor1'])),
         ),
         BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.dollarSign,
            color: _currentIndex == 1 ? environment['cor1'] : Colors.black54,
           ),
           title: Text('Faturas',style: TextStyle(color: environment['cor1'])),
         ),
         BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.robot,
            color: _currentIndex == 2 ? environment['cor1'] : Colors.black54,
           ),
           title: Text('Atendimentos',style: TextStyle(color: environment['cor1'])),
         ),
         BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.user,
            color: _currentIndex == 3 ? environment['cor1'] : Colors.black54,
           ),
           title: Text('Perfil',style: TextStyle(color: environment['cor1'])),
         )
       ],
      )
    );
  }
}
