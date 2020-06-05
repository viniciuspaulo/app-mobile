import 'dart:async';

import 'package:Clinicarx/app/modules/auth/login/login_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogadoPage extends StatefulWidget {
  static String tag = '/';
  const LogadoPage({Key key}) : super(key: key);

  @override
  _LogadoPageState createState() => _LogadoPageState();
}

class _LogadoPageState extends State<LogadoPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> animation2;

  AnimationController animationController;
  AnimationController animationController2;
  ConnectivityResult statusConnect;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    animation = Tween<double>(begin: -300, end: 0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animation2 = Tween<double>(begin: -300, end: 0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();

    Future.delayed(Duration(milliseconds: 1000), () {
      checkIfAuthenticated().then((success) async {
        if (success == 1) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, LoginScreen.tag);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  checkIfAuthenticated() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return 0;
    }

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      return 1;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/fundo.png"),
        fit: BoxFit.fill,
      )),
      child: Stack(children: [
        Positioned(
          child: Transform.translate(
            offset: Offset(animation.value, 0),
            child: Container(
                width: screenSize.width,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(500.0),
                    bottomRight: Radius.circular(500.0),
                  ),
                  child: Container(
                    color: Colors.white,
                  ),
                )),
          ),
        ),
        Positioned(
          child: Transform.translate(
            offset: Offset(animation2.value, 0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
