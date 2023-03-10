import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/data/api/model/api_day.dart';
import 'package:flutter_clean_architecture/src/data/api/request/get_day_body.dart';

class SunriseService {
  static const _baseUrl = 'https://api.sunrise-sunset.org';

  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<ApiDay> getDay(GetDayBody body) async {
    final response = await _dio.get('/json', queryParameters: body.toApi());

    return ApiDay.fromApi(response.data);
  }
}
