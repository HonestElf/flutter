import 'package:flutter/material.dart';

enum ThemeNameEnum { light, dark }

class AppTheme {
  Color primaryColor;
  Color secondaryColor;
  Color headerColor;
  Color buttonColor;

  Color primaryTextColor;
  Color secondaryTextColor;

  AppTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.headerColor,
    required this.buttonColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
  });

  AppTheme.lightTheme()
      : this(
            primaryColor: Colors.blue,
            secondaryColor: Colors.white,
            headerColor: Colors.blue,
            buttonColor: Colors.purple,
            primaryTextColor: Colors.black,
            secondaryTextColor: Colors.white);

  AppTheme.darkTheme()
      : this(
            primaryColor: Colors.grey,
            secondaryColor: Colors.black,
            headerColor: Colors.yellow,
            buttonColor: Colors.yellow,
            primaryTextColor: Colors.white,
            secondaryTextColor: Colors.black);
}
