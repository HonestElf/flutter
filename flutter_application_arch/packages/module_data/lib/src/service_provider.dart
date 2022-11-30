// import 'package:get_it/get_it.dart';
// import 'package:module_data/module_data.dart';
// import 'package:module_data/src/implemetation/internal.dart';

// class ServiceProvider {
//   static final _getIt = GetIt.I;

//   T get<T extends Object>() => _getIt.get<T>();

//   static final instance = ServiceProvider();

//   void initialize() {
//     _getIt.registerLazySingleton<HealthService>(() => DummyService());
//   }
// }

//added injectable

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_provider.config.dart';

// по лекции
// @InjectableInit()
// void initializeServices() => $initGetIt(GetIt.I);

// по документации
final getIt = GetIt.instance;

@InjectableInit()
void initializeServices() => getIt.init();
