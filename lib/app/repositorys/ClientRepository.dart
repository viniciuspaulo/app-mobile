


import 'package:Clinicarx/app/services/api.dart';
import 'package:flutter/material.dart';

class ClientRepository {
  final _private = new ApiService();

  Future postLogin({String document, @required String password}) async {
    return await _private.postRequest('/login', {
      "document": "",
      "password": "",
    });
  }
}
