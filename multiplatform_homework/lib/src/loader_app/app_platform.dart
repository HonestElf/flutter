// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

enum CustomPlatform { linux, macos, windows, ios, android, web, undefined }

class AppPlatform {
  static const Map<String, CustomPlatform> _platformMap = {
    'linux': CustomPlatform.linux,
    'macos': CustomPlatform.macos,
    'windows': CustomPlatform.windows,
    'ios': CustomPlatform.ios,
    'android': CustomPlatform.android,
  };

  static CustomPlatform _getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web;
    }
    return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefined;
  }

  static String _getPlatformName() {
    if (kIsWeb) {
      return 'Web';
    }
    return Platform.operatingSystem;
  }

  static String get platformName => _getPlatformName();

  static CustomPlatform get platform => _getPlatform();

  static bool get isMobile =>
      platform == CustomPlatform.ios || platform == CustomPlatform.android;
}
