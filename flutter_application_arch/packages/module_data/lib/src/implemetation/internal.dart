// import 'package:module_data/module_data.dart';

// class DummyService implements HealthService {
//   @override
//   bool getHealth() {
//     return true;
//   }
// }

//added injectable

import 'package:injectable/injectable.dart';
import 'package:module_data/module_data.dart';

@LazySingleton(as: HealthService)
class DummyService implements HealthService {
  @override
  bool getHealth() {
    return true;
  }
}
