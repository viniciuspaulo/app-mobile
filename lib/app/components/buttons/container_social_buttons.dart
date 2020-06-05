import 'dart:io';

import 'package:Clinicarx/app/components/buttons/social_button.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/repositories/ClientRepository.dart';
import 'package:Clinicarx/app/utils/device.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:Clinicarx/app/services/social_auth.dart';
import 'package:toast/toast.dart';

class ContainerSocialButtons extends StatefulWidget {
  @override
  _ContainerSocialButtons createState() => _ContainerSocialButtons();
}

class _ContainerSocialButtons extends State<ContainerSocialButtons> {
  String loadSocial = "";
  int minimumIosVersionCompatibleWithAppleSignin = 13;
  bool isIosDeviceVersionCompatibleWithAppleSignin = false;

  UserModel _user = new UserModel();
  ClientRepository _clientRepository = new ClientRepository();

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) checkCompatibilityIosDevice();
  }

  void checkCompatibilityIosDevice() async {
    final verificationIosVersionCompatibility =
        await DeviceUtils.isIosVersionCompatible(
            minimumIosVersionCompatibleWithAppleSignin);

    setState(() => isIosDeviceVersionCompatibleWithAppleSignin =
        verificationIosVersionCompatibility);
  }

  // TODO: mover para um service
  void submitSocial(String provider) async {
    setState(() => loadSocial = provider);
    try {
      if (provider == "google") {
        _user = await signInGoogle();
      }

      if (provider == "facebook") {
        _user = await signInFacebook();
      }

      if (provider == "apple") {
        _user = await signInApple();
      }

      var result = await _clientRepository.postLogin(_user);
      setState(() => loadSocial = "");

      print(result);
      // if (result['first_access'] != null) {
      //   Navigator.pushNamed(context, RegisterScreen.tag);
      //   return;
      // }
      // Navigator.pushReplacementNamed(context, HomeScreen.tagRota);
    } catch (mensagem) {
      Toast.show("Não possivel logar.", context);
      setState(() => loadSocial = "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          image:
              Image(image: AssetImage('assets/images/google.png'), width: 18),
          load: loadSocial == "google" ? true : false,
          onPressed: () {
            submitSocial("google");
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SocialButton(
            icon: Icon(
              FontAwesomeIcons.facebook,
              size: 18,
              color: Colors.blue,
            ),
            load: loadSocial == "facebook" ? true : false,
            onPressed: () {
              submitSocial("facebook");
            },
          ),
        ),
        (() {
          if (isIosDeviceVersionCompatibleWithAppleSignin) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SocialButton(
                icon: Icon(
                  FontAwesomeIcons.apple,
                  size: 18,
                ),
                load: loadSocial == "apple" ? true : false,
                onPressed: () {
                  submitSocial("apple");
                },
              ),
            );
          } else {
            return Container();
          }
        }()),
      ],
    );
  }
}
