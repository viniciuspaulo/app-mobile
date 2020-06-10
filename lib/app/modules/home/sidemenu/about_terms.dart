import 'package:Clinicarx/app/components/containers/text_terms.dart';
import 'package:flutter/material.dart';

class AboutTermsScreen extends StatefulWidget {
  const AboutTermsScreen({Key key}) : super(key: key);

  static String tag = '/about-terms';
  static String tagRota = '/home/about-terms';

  @override
  _AboutTermsScreen createState() => _AboutTermsScreen();
}

class _AboutTermsScreen extends State<AboutTermsScreen> {
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
      body: TextTerms(),
    );
  }
}
