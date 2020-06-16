import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_acess_screen.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_info_screen.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_responsible_screen.dart';
import 'package:Clinicarx/app/modules/home/perfil/perfil_social_screen.dart';
import 'package:flutter/material.dart';

class PerfilEditScreen extends StatefulWidget {
  static String tagRota = '/home/perfil-edit';
  static String tag = '/perfil-edit';
  final Key menuKey;

  const PerfilEditScreen({Key key, this.menuKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PerfilEditScreenState();
}

class _PerfilEditScreenState extends State<PerfilEditScreen> {
  ProfileModel profile;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      profile = ModalRoute.of(context).settings.arguments;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Image(
          width: 120,
          image: AssetImage(
            "assets/images/logo.png",
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: profile != null
          ? Container(
              padding: const EdgeInsets.all(8.0),
              width: screenSize.width,
              height: screenSize.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PerfilInfoScreen(profile, _scaffoldKey),
                    Divider(color: Colors.transparent),
                    PerfilAcessScreen(profile, _scaffoldKey),
                    Divider(color: Colors.transparent),
                    PerfilSocialScreen(profile, _scaffoldKey),
                    Divider(color: Colors.transparent),
                    PerfilResponsibleScreen(profile, _scaffoldKey),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              ),
            ),
    );
  }
}
