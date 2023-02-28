import 'package:flutter/services.dart';

class PlatformService {
  static const method = MethodChannel('CALL_METHOD');
  static const stream = EventChannel('CALL_EVENTS');

  Future<int> callMethodChannel() async {
    try {
      return await method.invokeMethod('CALL');
    } on PlatformException catch (e) {
      print('Failed to get value: "${e.message}".');
      return 0;
    }
  }

  Stream<int> getStream() =>
      stream.receiveBroadcastStream().map((event) => event as int);
}
