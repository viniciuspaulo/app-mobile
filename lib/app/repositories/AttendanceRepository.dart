import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:Clinicarx/env.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class AttendcePaginate {
  List<AttendancesModel> data = [];
  int total = 0;
}

class AttendanceRepository {
  final _private = new ApiService();

  Future<AttendcePaginate> getAttendences({int page = 0}) async {
    Options options = buildCacheOptions(
      Duration(minutes: environment['cacheTimeMinutes']),
      subKey: "page={$page}",
    );

    Response response = await _private.getRequest(
        url: 'attendances?page=' + page.toString(), options: options);

    AttendcePaginate result = new AttendcePaginate();
    result.data = AttendancesModel.encondeToJson(response.data['data']['data']);
    result.total = response.data['data']['meta']['total'];
    return result;
  }

  Future<AttendancesModel> getAttendenceId(AttendancesModel attendence) async {
    Options options = buildCacheOptions(
      Duration(minutes: environment['cacheTimeMinutes']),
    );

    Response response = await _private.getRequest(
      url: 'attendances/' + attendence.id,
      options: options,
    );
    return AttendancesModel.fromJson(response.data['data']);
  }

  Future<String> getAttendenceFileDetail(AttendancesFilesModel file) async {
    Options options = buildCacheOptions(
      Duration(minutes: environment['cacheTimeMinutes']),
    );

    Response response = await _private.getRequest(
      url: 'file/' + file.id,
      options: options,
    );
    return response.data['data']['file'];
  }

  Future getAttendenceRating(AttendancesModel attendence) async {
    Response response = await _private.postRequest(
      url: 'attendances/' + attendence.id + '/rating',
      data: {'rating': attendence.rating},
    );
    return response.data['data'];
  }
}
