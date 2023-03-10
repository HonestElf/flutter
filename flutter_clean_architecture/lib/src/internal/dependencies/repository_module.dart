import 'package:flutter_clean_architecture/src/data/repository/day_data_repository.dart';
import 'package:flutter_clean_architecture/src/domain/repository/day_repository.dart';
import 'package:flutter_clean_architecture/src/internal/dependencies/api_module.dart';

class RepositoryModule {
  static DayRepository? _dayRepository;

  static DayRepository dayRepository() {
    _dayRepository ??= DayDataRepository(
      ApiModule.apiUtil(),
    );

    return _dayRepository!;
  }
}
