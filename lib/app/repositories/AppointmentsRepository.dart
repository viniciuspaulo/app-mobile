import 'package:Clinicarx/app/models/AppointmentsModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:dio/dio.dart';

class AppointmentsPaginate {
  List<AppointmentsModel> data = [];
  int total = 0;
}

class AppointmentsRepository {
  final _private = new ApiService();

  Future<List<AppointmentsModel>> getAppointments() async {
    Response response = await _private.getRequest('appointments');
    return AppointmentsModel.encondeToJson(response.data['data']['data']);
  }

  Future<AppointmentsModel> getAppointmentsId(
      AppointmentsModel appointment) async {
    Response response =
        await _private.getRequest('appointments/' + appointment.id);
    return AppointmentsModel.fromJson(response.data['data']);
  }
}
