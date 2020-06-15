import 'package:Clinicarx/app/models/MedicineModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:dio/dio.dart';

class MedicinePaginate {
  List<MedicineModel> data = [];
  int total = 0;
}

class MedicineRepository {
  final _private = new ApiService();

  Future<MedicinePaginate> getMedicine({int page = 0}) async {
    Response response =
        await _private.getRequest('medicines?page=' + page.toString());
    MedicinePaginate result = new MedicinePaginate();
    result.data = MedicineModel.encondeToJson(response.data['data']['data']);
    result.total = response.data['data']['meta']['total'];
    return result;
  }
}
