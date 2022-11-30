import 'package:module_data/module_data.dart';

class DummyService implements HealthService {
  @override
  bool getHealth() {
    return true;
  }
}
