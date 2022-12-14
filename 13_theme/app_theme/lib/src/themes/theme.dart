import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();

Color primaryColor = Colors.black54;
Color secondaryColor = Colors.deepOrange[200]!;

ThemeData themeLight = _themeLight.copyWith(
    textSelectionTheme:
        _themeLight.textSelectionTheme.copyWith(cursorColor: primaryColor),
    progressIndicatorTheme:
        _themeLight.progressIndicatorTheme.copyWith(color: primaryColor),
    inputDecorationTheme:
        _inputDecorationLight(_themeLight.inputDecorationTheme),
    chipTheme: _chipLight(_themeLight.chipTheme),
    primaryColorDark: secondaryColor,
    elevatedButtonTheme: _elevatedButtonLight(),
    colorScheme: _themeLight.colorScheme.copyWith(primary: secondaryColor),
    cardTheme: _cardLight(_themeLight.cardTheme),
    bottomNavigationBarTheme: _themeLight.bottomNavigationBarTheme.copyWith(
        backgroundColor: primaryColor, selectedItemColor: secondaryColor),
    dialogTheme: _dialogLight(_themeLight.dialogTheme),
    textTheme: _textLight(_themeLight.textTheme),
    appBarTheme: _appBarLight(_themeLight.appBarTheme));

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
      bodyText2: base.bodyText2!.copyWith(color: Colors.black),
      headline4: base.headline4!.copyWith(color: primaryColor));
}

AppBarTheme _appBarLight(AppBarTheme base) {
  return base.copyWith(
    foregroundColor: secondaryColor,
    color: primaryColor,
  );
}

DialogTheme _dialogLight(DialogTheme base) {
  return base.copyWith(
    backgroundColor: Colors.grey,
  );
}

ChipThemeData _chipLight(ChipThemeData base) {
  return base.copyWith(
      backgroundColor: primaryColor,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: secondaryColor,
      showCheckmark: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));
}

ElevatedButtonThemeData _elevatedButtonLight() {
  return ElevatedButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
  );
}

CardTheme _cardLight(CardTheme base) {
  return base.copyWith(
      color: secondaryColor,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))));
}

InputDecorationTheme _inputDecorationLight(InputDecorationTheme base) {
  return base.copyWith(
      labelStyle: TextStyle(
        color: primaryColor,
      ),
      floatingLabelStyle: TextStyle(color: secondaryColor));
}
