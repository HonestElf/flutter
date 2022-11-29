// abstract class HealthService {
//   bool getHealth();
// }

import 'package:module_model/module_model.dart';

abstract class UserService {
  Future<UserData> getDefaultUser();
  Future<UserData> getUserById(int id);
}
