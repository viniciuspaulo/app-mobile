


import 'package:Clinicarx/app/models/AttendancesModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:dio/dio.dart';

class AttendcePaginate {
  List<AttendancesModel> data = [];
  int total = 0;
}

class AttendanceRepository {
  final _private = new ApiService();

  Future<AttendcePaginate> getAttendences({int page = 0}) async {
    Response response = await _private.getRequest('attendances?page='+page.toString());
    AttendcePaginate result = new AttendcePaginate();
    result.data = AttendancesModel.encondeToJson(response.data['data']['data']);
    result.total = response.data['data']['meta']['total'];
    return result;
  }

  Future<AttendancesModel> getAttendenceId(AttendancesModel attendence) async {
    Response response = await _private.getRequest('attendances/'+attendence.id);
    return AttendancesModel.fromJson(response.data['data']);
  }

  Future<String> getAttendenceFileDetail(AttendancesFilesModel file) async {
    Response response = await _private.getRequest('file/'+file.id);
    return response.data['data']['file'];
  }

  Future getAttendenceRating(AttendancesModel attendence) async {
    Response response = await _private.postRequest('attendances/'+attendence.id+'/rating',{
      'rating': attendence.rating
    });
    return response.data['data'];
  }

}
