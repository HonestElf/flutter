// import 'package:module_data/module_data.dart';

// class DummyService implements HealthService {
//   @override
//   bool getHealth() {
//     return true;
//   }
// }

//added injectable

// import 'package:injectable/injectable.dart';
// import 'package:module_data/module_data.dart';

// @LazySingleton(as: HealthService)
// class DummyService implements HealthService {
//   @override
//   bool getHealth() {
//     return true;
//   }
// }

// added freezed and module_model
import 'package:injectable/injectable.dart';
import 'package:module_data/module_data.dart';
import 'package:module_model/module_model.dart';

@LazySingleton(as: UserService)
class DummyUserService implements UserService {
  @override
  Future<UserData> getDefaultUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return const UserData(id: 1, name: 'Default');
  }

  @override
  Future<UserData> getUserById(int id) async {
    await Future.delayed(const Duration(seconds: 1));

    return UserData(id: id, name: 'User number $id');
  }
}
