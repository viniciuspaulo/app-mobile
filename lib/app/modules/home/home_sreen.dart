import 'dart:async';

import 'package:Clinicarx/app/components/connect.dart';
import 'package:Clinicarx/app/components/menu.dart';
import 'package:Clinicarx/app/modules/home/attendance/attendances_screen.dart';
import 'package:Clinicarx/app/modules/home/medicines/medicines_screen.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_screen.dart';
import 'package:Clinicarx/env.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import '../../services/firebase_notifications.dart';

class HomeScreen extends StatefulWidget {
  static String tag = '/home-tab';
  static String tagRota = '/home/home-tab';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AttendancesScreen(),
    MedicinesScreen(),
    PerfilScreen()
  ];

  StreamSubscription<ConnectivityResult> subscription;
  ConnectivityResult statusConnect;

  void onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  initState() {
    super.initState();

    //Verifica conexao com internet
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() => statusConnect = result);
      if (statusConnect == ConnectivityResult.wifi ||
          statusConnect == ConnectivityResult.mobile) {
        new FirebaseNotifications(context).setUpFirebase();
      }
    });

    (Connectivity().checkConnectivity()).then((connectivityResult) {
      setState(() => statusConnect = connectivityResult);
    });
  }

  @override
  Widget build(BuildContext contex) {
    return statusConnect != ConnectivityResult.wifi &&
            statusConnect != ConnectivityResult.mobile
        ? Connect()
        : Scaffold(
            drawer: Menu(),
            body: IndexedStack(
              index: _currentIndex,
              children: _children,
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 14,
              elevation: 0,
              backgroundColor: environment['cor1'],
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Image(
                    width: 30,
                    height: 30,
                    image: AssetImage(
                      "assets/images/icon_atend.png",
                    ),
                  ),
                  title: Text(
                    'Atendimentos',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    width: 30,
                    height: 30,
                    image: AssetImage(
                      "assets/images/ICON_CAPSULE.png",
                    ),
                  ),
                  title: Text(
                    'Medicamentos',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    width: 30,
                    height: 30,
                    image: AssetImage(
                      "assets/images/ICON_USER.png",
                    ),
                  ),
                  title: Text(
                    'Perfil',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          );
  }
}
