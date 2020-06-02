
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
    return Text("Menu");
  }
}
