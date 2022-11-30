// abstract class HealthService {
//   bool getHealth();
// }

// added freezed and module_model
import 'package:module_model/module_model.dart';

abstract class UserService {
  Future<UserData> getDefaultUser();
  Future<UserData> getUserById(int id);
}
