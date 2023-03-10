import 'package:flutter_clean_architecture/src/data/api/request/get_day_body.dart';
import 'package:flutter_clean_architecture/src/data/api/service/sunrise_service.dart';
import 'package:flutter_clean_architecture/src/data/mapper/day_mapper.dart';
import 'package:flutter_clean_architecture/src/domain/model/day.dart';

class ApiUtil {
  final SunriseService _sunriseService;

  ApiUtil(this._sunriseService);

  Future<Day> getDay(
      {required double latitude, required double longitude}) async {
    final body = GetDayBody(latitude: latitude, longitude: longitude);
    final result = await _sunriseService.getDay(body);

    return DayMapper.fromApi(result);
  }
}
