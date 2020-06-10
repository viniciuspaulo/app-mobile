import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/buttons/secondary_button.dart';
import 'package:Clinicarx/app/components/containers/text_terms.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/modules/home/home_sreen.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key key}) : super(key: key);
  static String tag = '/terms';

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool load = false;
  bool isTermsAccepted = false;
  UserModel _user = new UserModel();
  String nextScreen = HomeScreen.tag;

  void handleTerms() {
    if (nextScreen == HomeScreen.tag) {
      Navigator.pushReplacementNamed(context, HomeScreen.tagRota);
    } else {
      Navigator.pushNamed(context, nextScreen, arguments: _user);
    }
  }

  @override
  initState() {
    Future.delayed(Duration.zero, () {
      dynamic arguments = ModalRoute.of(context).settings.arguments;
      if (arguments['user'] != null) {
        _user = arguments['user'];
      }
      if (arguments['nextScreen'] != null) {
        nextScreen = arguments['nextScreen'];
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 200,
              height: 60,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 54),
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Antes de continuar você deve ler e aceitar os termos abaixo:',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 33),
              height: 250,
              child: TextTerms(),
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: isTermsAccepted,
                      onChanged: (bool value) {
                        setState(() {
                          isTermsAccepted = !isTermsAccepted;
                        });
                      },
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isTermsAccepted = !isTermsAccepted;
                        });
                      },
                      child: Text(
                        'Li e aceito os Termos de Uso',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.only(top: 16),
              child: PrimaryButton(
                  text: 'aceitar e continuar',
                  onPressed: handleTerms,
                  load: load,
                  disabled: !isTermsAccepted),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.only(top: 16),
              child: SecundaryButton(
                text: 'declinar',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
