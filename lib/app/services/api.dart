import 'package:Clinicarx/env.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String _baseUrl = environment['baseUrl'];
  final Dio _dio = Dio();

  double latitude;
  double longitude;

  _meutoken() async {
    // _dio.options.connectTimeout = 13000;
    // _dio.options.receiveTimeout = 13000;

    _dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      this._dio.options.headers = {
        'Authorization': 'Bearer ' + prefs.getString('token'),
      };

      try {
        if (await Geolocator().isLocationServiceEnabled()) {
          Position position = await Geolocator()
              .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
          this._dio.options.headers = {
            'Authorization': 'Bearer ' + prefs.getString('token'),
            'position_lat': position.latitude,
            'position_lng': position.longitude,
          };
          latitude = position.latitude;
          longitude = position.longitude;
        }
      } catch (e) {}
    }
  }

  Future getRequest({@required String url, Options options}) async {
    await _meutoken();
    try {
      String urlRequest = '$_baseUrl/$url';

      if (url.split('?').length > 1) {
        if (latitude != null && longitude != null) {
          urlRequest =
              urlRequest + "\&position_lat=$latitude&position_lng=$longitude";
        }
      } else {
        if (latitude != null && longitude != null) {
          urlRequest =
              urlRequest + "\?position_lat=$latitude&position_lng=$longitude";
        }
      }

      print(urlRequest);
      return await this._dio.get(urlRequest, options: options);
    } on DioError catch (e) {
      print(e.response.data);
      throw (e.response.data['data']['message']);
    }
  }

  Future postRequest(
      {@required String url, dynamic data, Options options}) async {
    await _meutoken();
    try {
      String urlRequest = '$_baseUrl/$url';
      if (latitude != null && longitude != null) {
        urlRequest =
            urlRequest + "\?position_lat=$latitude&position_lng=$longitude";
      }

      if (url == 'auth/login') {
        DioCacheManager(CacheConfig(baseUrl: _baseUrl)).clearAll();
      }

      print(urlRequest);
      return await this._dio.post(urlRequest, data: data, options: options);
    } on DioError catch (e) {
      print(e.response.data);
      throw (e.response.data['data']['message']);
    }
  }

  Future putRequest({
    @required String url,
    dynamic data,
    Options options,
  }) async {
    await _meutoken();

    if (url == 'profile') {
      DioCacheManager(CacheConfig(baseUrl: _baseUrl)).clearAll();
    }

    try {
      String urlRequest = '$_baseUrl/$url';
      if (latitude != null && longitude != null) {
        urlRequest =
            urlRequest + "\?position_lat=$latitude&position_lng=$longitude";
      }
      print(urlRequest);
      return await this._dio.put(urlRequest, data: data, options: options);
    } on DioError catch (e) {
      if (e.response.data['data']['errors'] != null) {
        throw (e.response.data['data']['errors']);
      }
      throw (e.response.data['data']['message']);
    }
  }
}
