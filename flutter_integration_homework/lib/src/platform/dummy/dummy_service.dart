import 'package:flutter_integration_homework/src/platform/service.dart';

class PlatformServiceImpl implements PlatformService {
  @override
  Future<String> getValue(String text) async {
    return 'Dummy text';
  }
}
