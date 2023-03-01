import 'package:flutter/services.dart';
import 'package:flutter_integration_homework/src/platform/service.dart';

class PlatformServiceImpl implements PlatformService {
  static const channel = MethodChannel('CALL_METHOD');

  @override
  Future<String> getValue(String text) async {
    try {
      return await channel.invokeMethod('CALL', text);
    } on PlatformException catch (e) {
      print('Failed to get value: "${e.message}".');
      return 'No text';
    }
  }
}
