import 'package:flutter_clean_architecture/src/data/api/model/api_day.dart';
import 'package:flutter_clean_architecture/src/domain/model/day.dart';

class DayMapper {
  static Day fromApi(ApiDay day) {
    return Day(
        sunrise: DateTime.tryParse(day.sunrise) ?? DateTime(1970),
        sunset: DateTime.tryParse(day.sunset) ?? DateTime(1970),
        solarNoon: DateTime.tryParse(day.solarNoon) ?? DateTime(1970),
        dayLength: day.dayLength.toInt());
  }
}
