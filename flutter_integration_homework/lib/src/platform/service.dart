import './dummy/dummy_service.dart'
    if (dart.library.io) 'mobile/mobile_service.dart';

abstract class PlatformService {
  Future<String> getValue(String text);
}

PlatformService getService() {
  return PlatformServiceImpl();
}
