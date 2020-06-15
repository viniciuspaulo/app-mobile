import 'package:Clinicarx/app/models/MedicineModel.dart';
import 'package:Clinicarx/app/services/api.dart';
import 'package:Clinicarx/env.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class MedicinePaginate {
  List<MedicineModel> data = [];
  int total = 0;
}

class MedicineRepository {
  final _private = new ApiService();

  Future<MedicinePaginate> getMedicine({int page = 0}) async {
    Options options = buildCacheOptions(
      Duration(minutes: environment['cacheTimeMinutes']),
      subKey: "page={$page}",
    );

    Response response = await _private.getRequest(
        url: 'medicines?page=' + page.toString(), options: options);
    MedicinePaginate result = new MedicinePaginate();
    result.data = MedicineModel.encondeToJson(response.data['data']['data']);
    result.total = response.data['data']['meta']['total'];
    return result;
  }
}
