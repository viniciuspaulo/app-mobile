import 'package:Clinicarx/app/models/ProfileModel.dart';
import 'package:Clinicarx/app/models/ResponsiblesModel.dart';
import 'package:Clinicarx/app/models/UserModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:Clinicarx/app/validations/validacao.dart';
import 'package:dio/dio.dart';
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
    print(paramets);
    Response response = await _private.postRequest('auth/login', paramets);

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

    Response response =
        await _private.postRequest('auth/register', user.toJson());

    final storage = await SharedPreferences.getInstance();
    await storage.setString("token", response.data['data']['access_token']);

    postSyncronize();

    return response.data['data'];
  }

  Future postSyncronize() async {
    Response response = await _private.putRequest('synchronize', {});
    return response.data['data'];
  }

  Future postForgotPassword(UserModel user) async {
    Response response = await _private
        .postRequest('auth/forgot-password', {'email': user.email});
    return response.data['data'];
  }

  Future postValidateResetPassword(String code) async {
    Response response = await _private
        .postRequest('auth/validate-reset-password', {'code': code});
    return response.data['data'];
  }

  Future postUpdatePassword(String password) async {
    Response response = await _private
        .postRequest('auth/update-password', {'password': password});
    return response.data['data'];
  }

  Future putProfile(ProfileModel profile) async {
    dynamic data = profile.toJson();
    if (profile.birthday != null) {
      data['birthday'] = profile.birthday.format('yyyy-MM-dd');
    }
    Response response = await _private.putRequest('profile', data);
    return ProfileModel.fromJson(response.data['data']['user']);
  }

  Future putProfileSocialMidia(String provider, String providerId) async {
    Response response = await _private.putRequest(
        'profile', {'${provider}_token': providerId, 'social_midia': true});
    return ProfileModel.fromJson(response.data['data']['user']);
  }

  Future getProfile() async {
    Response response = await _private.getRequest('profile');
    return ProfileModel.fromJson(response.data['data']);
  }

  Future getSearchDocument(String document) async {
    Response response = await _private
        .getRequest('auth/search-document/' + somenteNumeros(document));
    return response.data['data'];
  }

  Future putProfilePassword(String password) async {
    Response response =
        await _private.putRequest('profile/password', {"password": password});
    return response.data['data'];
  }

  Future putResponsibles(ResponsiblesModel responsible) async {
    Response response = await _private.putRequest('profile/responsibles', {});
    return response.data['data'];
  }
}
