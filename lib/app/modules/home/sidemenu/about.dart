import 'package:Clinicarx/app/components/containers/text_about.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  static String tag = '/about';
  static String tagRota = '/home/about';

  @override
  _AboutScreen createState() => _AboutScreen();
}

class _AboutScreen extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          width: 120,
          image: AssetImage(
            "assets/images/logo.png",
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: TextAbout(),
    );
  }
}
