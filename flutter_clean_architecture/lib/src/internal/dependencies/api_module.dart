import 'package:flutter_clean_architecture/src/data/api/api_util.dart';
import 'package:flutter_clean_architecture/src/data/api/service/sunrise_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil(SunriseService());
    return _apiUtil!;
  }
}
