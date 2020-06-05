
import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/repositorys/ClientRepository.dart';
import 'package:Clinicarx/app/services/social_auth.dart';
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

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text("DADOS DE ACESSO",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54
              ),
            ),
            Divider(color: Colors.transparent),

            ListTile(
              leading: Icon(FontAwesomeIcons.google, color: Colors.red),
              title: Text("Google"),
              trailing: Switch(
                value: widget.profile.googleToken != null ? true : false,
                onChanged: (value) async { 
                  if (value) {
                    try {
                      UserModel user = await signInGoogle();
                      widget.profile.googleToken = user.providerToken;
                      await repositorio.putProfile(widget.profile);
                      setState(() {});
                    } catch (mensagem) {
                      setState(() {
                        widget.profile.googleToken = null;
                      });
                      Toast.show(mensagem.toString(), context);
                      return;
                    }
                  } else {
                    setState(() {
                      widget.profile.googleToken = null;
                    });
                  }
                },
                activeTrackColor: Colors.tealAccent,
                activeColor: Colors.teal,
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.facebook, color: Colors.blue),
              title: Text("Facebook"),
              trailing: Switch(
                value: widget.profile.facebookToken != null ? true : false,
                onChanged: (value) async { 
                  if (value) {
                   try {
                      UserModel user = await signInFacebook();
                      widget.profile.facebookToken = user.providerToken;
                      await repositorio.putProfile(widget.profile);
                      setState(() { });
                    } catch (mensagem) {
                      setState(() {
                        widget.profile.googleToken = null;
                      });
                      Toast.show(mensagem.toString(), context);
                      return;
                    }
                  } else {
                    setState(() {
                      widget.profile.googleToken = null;
                    });
                  }
                },
                activeTrackColor: Colors.tealAccent,
                activeColor: Colors.teal,
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.apple, color: Colors.black),
              title: Text("Apple"),
              trailing: Switch(
                value: widget.profile.appleToken != null ? true : false,
                onChanged: (value) async { 
                  if (value) {
                   try {
                      UserModel user = await signInApple();
                      widget.profile.appleToken = user.providerToken;
                      await repositorio.putProfile(widget.profile);
                      setState(() { });
                    } catch (mensagem) {
                      setState(() {
                        widget.profile.googleToken = null;
                      });
                      Toast.show(mensagem.toString(), context);
                      return;
                    }
                  } else {
                    setState(() {
                      widget.profile.googleToken = null;
                    });
                  }
                },
                activeTrackColor: Colors.tealAccent,
                activeColor: Colors.teal,
              ),
            )

          ],
        ),
      ),
    );
  }

}
