import 'package:Clinicarx/app/constants/strings.dart';
import 'package:Clinicarx/app/components/buttons/primary_button.dart';
import 'package:Clinicarx/app/components/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
// import 'package:toast/toast.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({Key key}) : super(key: key);
  static String tag = '/terms';

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool loading = false;
  bool termsAccepted = false;

  void handleTerms() {
    /**
     * Se estiver fazendo o cadastro com login social:
     * - Segue para tela de CPF
     * - Senão segue direto para a home ou, caso tenha faltado algum dado, segue
     * para a tela de complementar dados
     */
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
              height: 251,
              width: 312,
              child: SingleChildScrollView(
                  child: Column(children: [
                Text(
                  Strings.terms,
                  style: TextStyle(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ]))),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: termsAccepted,
                    onChanged: (bool value) {
                      setState(() {
                        termsAccepted = !termsAccepted;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        termsAccepted = !termsAccepted;
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
                  loading: loading)),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.only(top: 16),
              child: SecundaryButton(
                text: 'declinar',
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
        ],
      ),
    ));
  }
}
