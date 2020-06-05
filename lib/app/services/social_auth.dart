import 'dart:io';

import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookLogin facebookLogin = FacebookLogin();

final repositorio = new ApiService();

Future<UserModel> signInGoogle() async {
  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    if (authResult == null) {
      throw "Não foi possivel logar";
    }
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    UserModel _user = new UserModel();
    _user.email = user.email;
    _user.name = user.displayName;
    _user.photo = user.photoUrl;
    _user.googleToken = user.providerId;

    _user.provider = "google";
    _user.providerToken = user.providerId;

    return _user;
  } catch (e) {
    throw Exception("Não foi possivel logar");
  }
}

Future<UserModel> signInFacebook() async {
  try {
    facebookLogin.loginBehavior = Platform.isIOS
        ? FacebookLoginBehavior.webViewOnly
        : FacebookLoginBehavior.nativeWithFallback;

    final result = await facebookLogin.logIn(['email']);

    final AuthCredential credential = FacebookAuthProvider.getCredential(
      accessToken: result.accessToken.token,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    if (authResult == null) {
      throw "Não foi possivel logar";
    }
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    UserModel _user = new UserModel();
    _user.email = user.email;
    _user.name = user.displayName;
    _user.photo = user.photoUrl;
    _user.facebookToken = user.providerId;

    _user.provider = "facebook";
    _user.providerToken = user.providerId;

    return _user;
  } catch (e) {
    throw "Não foi possivel logar";
  }
}

Future<UserModel> signInApple() async {
  try {
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);
    switch (result.status) {
      case AuthorizationStatus.authorized:
        UserModel _user = new UserModel();
        _user.email = result.credential.email;
        _user.name =
            "${result.credential.fullName.givenName} ${result.credential.fullName.familyName}";
        _user.appleToken = "apple_" + result.credential.email;

        _user.provider = "apple";
        _user.providerToken = _user.appleToken;

        return _user;
        break;
      case AuthorizationStatus.error:
        throw "Não foi possivel logar";
        break;
      case AuthorizationStatus.cancelled:
        throw "Não foi possivel logar";
        break;
    }
  } catch (e) {
    throw "Não foi possivel logar";
  }
}
