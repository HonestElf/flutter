import 'package:flutter_integration/src/js_interop/platform/service.dart';
import 'package:flutter_integration/src/js_interop/platform/web/web_interop.dart';

class PlatformServiceImpl implements PlatformService {
  final _manager = InteropManager();

  @override
  Future<int> getValue() async {
    return _manager.getValueFromJs();
  }

  @override
  Stream<int> getStream() => _manager.buttonClicked;
}
