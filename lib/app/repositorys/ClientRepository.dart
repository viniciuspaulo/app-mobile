


import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientRepository {
  final _private = new ApiService();

  Future postLogin(UserModel usuario) async {
    var paramets =  {};
    if (usuario.provider != null) {
      paramets = {
        'provider': usuario.provider,
        'provider_token': usuario.providerToken 
      };
    } else {
      paramets = {
        'document': somenteNumeros(usuario.document),
        'password': usuario.password 
      };
    }
    Response response = await _private.postRequest('auth/login',paramets);

    if (response.data['data']['first_access'] != null ) {
      return response.data['data'];
    }

    final storage = await SharedPreferences.getInstance();
    await storage.setString("token", response.data['data']['access_token']);
    return response.data['data'];
  }

  Future postForgotPassword(UserModel usuario) async {
    Response response = await _private.postRequest('auth/forgot-password',{
      'email': usuario.email
    });
    return response.data['data'];
  }

  Future postValidateResetPassword(String code) async {
    Response response = await _private.postRequest('auth/validate-reset-password',{
      'code': code
    });
    return response.data['data'];
  }

  Future postUpdatePassword(String password) async {
    Response response = await _private.postRequest('auth/update-password',{
      'password': password
    });
    return response.data['data'];
  }
}
