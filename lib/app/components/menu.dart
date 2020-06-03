
import 'package:Clinicarx/app/modules/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Menu extends StatefulWidget {
  final Key menuKey;
  const Menu({Key key, this.menuKey}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {


  Future<String> version() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  sair() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width - 100,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/fundo.png"),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sobre Clinicarx",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
          ),
          Divider(height: 25),
          Text("Termos de uso",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
          ),
         Divider(height: 25),
          Text("Reportar um problema",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
          ),
         Divider(height: 25),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, LoginPage.tag);
            },
            child: Text("Sair",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25
              ),
            ),
          ),
        ],
      ),
    );
  }
}
