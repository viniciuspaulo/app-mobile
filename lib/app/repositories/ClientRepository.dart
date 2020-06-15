import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/models/ResponsiblesModel.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:Clinicarx/env.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientRepository {
  final _private = new ApiService();

  Future postLogin(UserModel user) async {
    var paramets = {};

    if (user.provider != null) {
      paramets = {
        'provider': user.provider,
        'provider_token': user.providerToken
      };
    } else {
      paramets = {
        'document': somenteNumeros(user.document),
        'password': user.password
      };
    }

    Response response = await _private.postRequest(
      url: 'auth/login',
      data: paramets,
    );

    if (response.data['data']['first_access'] != null) {
      return response.data['data'];
    }

    final storage = await SharedPreferences.getInstance();
    await storage.setString("token", response.data['data']['access_token']);
    return response.data['data'];
  }

  Future postRegister(UserModel user) async {
    user.tos = true;
    user.document = somenteNumeros(user.document);

    List<String> dataList = user.birthday.split("/");
    if (dataList.length == 3) {
      user.birthday = (dataList[2] + "-" + dataList[1] + "-" + dataList[0]);
    }

    Response response = await _private.postRequest(
      url: 'auth/register',
      data: user.toJson(),
    );

    final storage = await SharedPreferences.getInstance();
    await storage.setString("token", response.data['data']['access_token']);

    postSyncronize();

    return response.data['data'];
  }

  Future postSyncronize() async {
    Response response = await _private.putRequest(
      url: 'synchronize',
      data: {},
    );
    return response.data['data'];
  }

  Future postForgotPassword(UserModel user) async {
    Response response = await _private.postRequest(
      url: 'auth/forgot-password',
      data: {'email': user.email},
    );
    return response.data['data'];
  }

  Future postValidateResetPassword(String code) async {
    Response response = await _private.postRequest(
      url: 'auth/validate-reset-password',
      data: {'code': code},
    );
    return response.data['data'];
  }

  Future postUpdatePassword(String password) async {
    Response response = await _private.postRequest(
      url: 'auth/update-password',
      data: {'password': password},
    );
    return response.data['data'];
  }

  Future putProfile(ProfileModel profile) async {
    dynamic data = profile.toJson();
    if (profile.birthday != null) {
      data['birthday'] = profile.birthday.format('yyyy-MM-dd');
    }
    Response response = await _private.putRequest(
      url: 'profile',
      data: data,
    );
    return ProfileModel.fromJson(response.data['data']['user']);
  }

  Future putProfileSocialMidia(String provider, String providerId) async {
    Response response = await _private.putRequest(
      url: 'profile',
      data: {'${provider}_token': providerId, 'social_midia': true},
    );
    return ProfileModel.fromJson(response.data['data']['user']);
  }

  Future getProfile() async {
    Options options = buildCacheOptions(
      Duration(minutes: environment['cacheTimeMinutes']),
    );

    Response response = await _private.getRequest(
      url: 'profile',
      options: options,
    );
    return ProfileModel.fromJson(response.data['data']);
  }

  Future getSearchDocument(String document) async {
    Response response = await _private.getRequest(
      url: 'auth/search-document/' + somenteNumeros(document),
    );
    return response.data['data'];
  }

  Future putProfilePassword(String password) async {
    Response response = await _private.putRequest(
      url: 'profile/password',
      data: {"password": password},
    );
    return response.data['data'];
  }

  Future putResponsibles(ResponsiblesModel responsible) async {
    Response response = await _private.putRequest(
      url: 'profile/responsibles',
      data: {},
    );
    return response.data['data'];
  }
}
