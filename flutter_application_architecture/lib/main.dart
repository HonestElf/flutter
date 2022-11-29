import 'package:flutter/material.dart';

import 'package:module_business/module_business.dart';

import 'my_app.dart';

void main() {
  // BlocFactory.instance.initialize();
  initializeBlocs();
  runApp(const MyApp());
}
