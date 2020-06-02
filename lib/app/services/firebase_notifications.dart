import 'dart:io';

import 'package:Clinicarx/app/repositorys/FirebaseRepository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class FirebaseNotifications {
  FirebaseMessaging _firebaseMessaging;
  final FirebaseRepository _repository = FirebaseRepository();

  void setUpFirebase() {
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessagingListeners();
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((token) {
      _repository.setTokenUser(token);
    });
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
  
}