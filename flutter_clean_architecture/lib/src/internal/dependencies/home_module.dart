import 'package:flutter_clean_architecture/src/domain/state/home/home_state.dart';
import 'package:flutter_clean_architecture/src/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(RepositoryModule.dayRepository());
  }
}
