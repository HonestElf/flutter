import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_theme/src/themes/cupertino_theme.dart';
import 'package:flutter_application_theme/src/themes/material_theme.dart';

enum CustomBrightness { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = themeLight;
  CustomBrightness _brightness = CustomBrightness.light;

  ThemeData get current => _currentTheme;
  CustomBrightness get brightness => _brightness;

  void toggle() {
    if (_brightness == CustomBrightness.light) {
      _brightness = CustomBrightness.dark;
      _currentTheme = themeDark;
    } else {
      _brightness = CustomBrightness.light;
      _currentTheme = themeLight;
    }

    notifyListeners();
  }
}

class ThemeProviderCupertino extends ChangeNotifier {
  CupertinoThemeData _current = cupertinoLightTheme;

  CustomBrightness _brightness = CustomBrightness.light;

  CupertinoThemeData get current => _current;
  CustomBrightness get brightness => _brightness;

  void toggle() {
    if (_brightness == CustomBrightness.light) {
      _brightness = CustomBrightness.dark;
      _current = cupertinoDarkTheme;
    } else {
      _brightness = CustomBrightness.light;
      _current = cupertinoLightTheme;
    }

    notifyListeners();
  }
}

class CommonThemeProvider extends ChangeNotifier {
  CustomBrightness _brightness = CustomBrightness.light;
  ThemeData _currentTheme = themeLight;
  CupertinoThemeData _cupertinoTheme = cupertinoLightTheme;

  CustomBrightness get brightness => _brightness;
  ThemeData get currentMaterialTheme => _currentTheme;
  CupertinoThemeData get currentCupertinoTheme => _cupertinoTheme;

  void toggle() {
    if (_brightness == CustomBrightness.light) {
      _brightness = CustomBrightness.dark;
      _currentTheme = themeDark;
      _cupertinoTheme = cupertinoDarkTheme;
    } else {
      _brightness = CustomBrightness.light;
      _currentTheme = themeLight;
      _cupertinoTheme = cupertinoLightTheme;
    }

    notifyListeners();
  }
}
