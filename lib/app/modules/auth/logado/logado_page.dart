import 'package:Clinicarx/app/modules/auth/login/login_page.dart';
import 'package:Clinicarx/env.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogadoPage extends StatefulWidget {
  final String title;
  static String tag = '/';
  const LogadoPage({Key key, this.title = "Logado"}) : super(key: key);

  @override
  _LogadoPageState createState() => _LogadoPageState();
}

class _LogadoPageState extends State<LogadoPage> {


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
    checkIfAuthenticated().then((success) async {
      if (success == 1) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, LoginPage.tag);
      }
    });

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fundo.png"),
            fit: BoxFit.fill,
          )
        ),
        child: Stack(children: [
          Positioned(
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
              )
            ),
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),

        ]),
      )
    );
  }
}
