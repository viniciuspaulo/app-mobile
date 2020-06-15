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
      if (double.parse(iosInfo.systemVersion) >= 13) {
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
              leading: Image(
                  image: AssetImage('assets/images/google.png'), width: 25),
              title: Text("Google"),
              trailing: Switch(
                value: widget.profile.googleToken != null ? true : false,
                onChanged: (value) async {
                  try {
                    String provider;
                    if (value) {
                      UserModel user = await signInGoogle();
                      provider = user.providerToken;
                    } else {
                      provider = null;
                    }
                    await repositorio.putProfileSocialMidia('google', provider);
                    setState(() {
                      widget.profile.googleToken = provider;
                    });
                  } catch (mensagem) {
                    Toast.show(mensagem.toString(), context, gravity: 1);
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
                    String provider;
                    if (value) {
                      UserModel user = await signInFacebook();
                      provider = user.providerToken;
                    } else {
                      provider = null;
                    }
                    await repositorio.putProfileSocialMidia(
                        'facebook', provider);
                    setState(() {
                      widget.profile.facebookToken = provider;
                    });
                  } catch (mensagem) {
                    Toast.show(mensagem.toString(), context, gravity: 1);
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
                          String provider;
                          if (value) {
                            UserModel user = await signInApple();
                            provider = user.providerToken;
                          } else {
                            provider = null;
                          }
                          await repositorio.putProfileSocialMidia(
                              'apple', provider);
                          setState(() {
                            widget.profile.appleToken = provider;
                          });
                        } catch (mensagem) {
                          Toast.show(mensagem.toString(), context, gravity: 1);
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
