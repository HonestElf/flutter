import 'package:advanced_widgets_homework/src/theme.dart';
import 'package:flutter/material.dart';

class AppThemeWidget extends InheritedWidget {
  final AppTheme theme;

  const AppThemeWidget({super.key, required this.theme, required Widget child})
      : super(child: child);

  static AppTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppThemeWidget>();

    assert(result != null, 'No AppThemeWidget found in context');
    return result!.theme;
  }

  @override
  bool updateShouldNotify(AppThemeWidget oldWidget) => theme != oldWidget.theme;
}
