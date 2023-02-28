import 'package:flutter_integration/src/js_interop/platform/service.dart';

class PlatformServiceImpl implements PlatformService {
  @override
  Future<int> getValue() async {
    return 10;
  }

  @override
  Stream<int> getStream() =>
      Stream.periodic(const Duration(seconds: 3), (i) => i * 50);
}
