// import 'package:get_it/get_it.dart';
// // import 'package:module_business/module_business.dart';
// import 'package:module_data/module_data.dart';

// import 'main_bloc.dart';

// class BlocFactory {
//   static final _getIt = GetIt.I;

//   T get<T extends Object>() => _getIt.get<T>();

//   static final instance = BlocFactory();

//   void initialize() {
//     ServiceProvider.instance.initialize();

//     _getIt.registerFactory<MainBloc>(() =>
//         MainBloc(healthService: ServiceProvider.instance.get<HealthService>()));
//   }
// }

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:module_data/module_data.dart';

@InjectableInit()
void initializeBlocs() {
  initializeServices();
  $initGetIt(GetIt.I);
}