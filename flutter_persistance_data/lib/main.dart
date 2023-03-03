import 'package:flutter/material.dart';
import 'package:flutter_persistance_data/src/local_storage/local_storage_app.dart';
import 'package:flutter_persistance_data/src/shared_prefs_app/shared_prefs_app.dart';
import 'package:flutter_persistance_data/src/hive_app/hive_app.dart';
import 'package:flutter_persistance_data/src/sqlApp/sql_app.dart';

void main() {
  // runApp(const SharedPrefsApp());
  // runApp(const HiveApp());
  // runApp(const LocalStorageApp());

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SqlApp());
}
