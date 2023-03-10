import 'package:flutter_clean_architecture/src/domain/model/day.dart';

abstract class DayRepository {
  Future<Day> getDay({required double latitude, required double longitude});
}
