import 'dart:io';

import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/services/social_auth.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

class PerfilSocialScreen extends StatefulWidget {
  final ProfileModel profile;
  PerfilSocialScreen(this.profile);

  @override
  State<StatefulWidget> createState() => _PerfilSocialScreenState();
}

class _PerfilSocialScreenState extends State<PerfilSocialScreen> {
  final repositorio = Modular.get<ClientRepository>();
  bool loading = false;

  Future<bool> validarApple() async {
    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var version = iosInfo.systemVersion;
      if (version.contains('13') == true) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              "DADOS DE ACESSO",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Divider(color: Colors.transparent),
            ListTile(
              leading: Icon(FontAwesomeIcons.google, color: Colors.red),
              title: Text("Google"),
              trailing: Switch(
                value: widget.profile.googleToken != null ? true : false,
                onChanged: (value) async {
                  try {
                    if (value) {
                      UserModel user = await signInGoogle();
                      widget.profile.googleToken = user.providerToken;
                    } else {
                      widget.profile.googleToken = null;
                    }
                    await repositorio.putProfileSocialMidia(
                        'google', widget.profile.googleToken);
                    setState(() {});
                  } catch (mensagem) {
                    Toast.show(mensagem.toString(), context);
                    return;
                  }
                },
                activeColor: Colors.teal,
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.facebook, color: Colors.blue),
              title: Text("Facebook"),
              trailing: Switch(
                value: widget.profile.facebookToken != null ? true : false,
                onChanged: (value) async {
                  try {
                    if (value) {
                      UserModel user = await signInFacebook();
                      widget.profile.facebookToken = user.providerToken;
                    } else {
                      widget.profile.facebookToken = null;
                    }
                    await repositorio.putProfileSocialMidia(
                        'facebook', widget.profile.facebookToken);
                    setState(() {});
                  } catch (mensagem) {
                    setState(() {
                      widget.profile.facebookToken = null;
                    });
                    Toast.show(mensagem.toString(), context);
                    return;
                  }
                },
                activeColor: Colors.teal,
              ),
            ),
            FutureBuilder(
              future: validarApple(),
              builder: (_, snapshot) {
                return Visibility(
                  visible: snapshot.hasData && snapshot.data,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.apple, color: Colors.black),
                    title: Text("Apple"),
                    trailing: Switch(
                      value: widget.profile.appleToken != null ? true : false,
                      onChanged: (value) async {
                        try {
                          if (value) {
                            UserModel user = await signInApple();
                            widget.profile.appleToken = user.providerToken;
                          } else {
                            widget.profile.appleToken = null;
                          }
                          await repositorio.putProfileSocialMidia(
                              'apple', widget.profile.appleToken);
                          setState(() {});
                        } catch (mensagem) {
                          Toast.show(mensagem.toString(), context);
                          return;
                        }
                      },
                      activeColor: Colors.teal,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
