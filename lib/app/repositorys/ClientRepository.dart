


import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientRepository {
  final _private = new ApiService();

  Future postLogin(UserModel usuario) async {
    Response response = await _private.postRequest('auth/login',{
      'document': somenteNumeros(usuario.document),
      'password': usuario.password 
    });

    final storage = await SharedPreferences.getInstance();
    await storage.setString("token", response.data['data']['access_token']);

    return true;
  }
}
