import 'package:flutter_integration/src/FFI/platform/service.dart';
import 'package:flutter_integration/src/FFI/platform/web/web_interop.dart';

class PlatformServiceImpl implements PlatformService {
  final _manager = InteropManager();

  @override
  int getValue() {
    return _manager.getValueFromJs();
  }

  @override
  Stream<int> getStream() => _manager.buttonClicked;
}
