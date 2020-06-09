import 'package:flutter/material.dart';

class AboutTermsScreen extends StatefulWidget {
  const AboutTermsScreen({Key key}) : super(key: key);

  static String tag = '/about-terms';
  static String tagRota = '/about-terms';

  @override
  _AboutTermsScreen createState() => _AboutTermsScreen();
}

class _AboutTermsScreen extends State<AboutTermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text:
                        'TERMOS DE USO DO CLINICARX - APLICATIVO DIGITAL DE SAÚDE'),
              ],
            ),
          )),
    );
  }
}
