import 'package:flutter/material.dart';
import 'package:flutter_persistance_homework/src/hive_app/hive_app.dart';
import 'package:flutter_persistance_homework/src/storage_app/storage_app.dart';
import 'package:flutter_persistance_homework/src/user_db_app/user_db_app.dart';

void main() {
  // runApp(const HiveApp());
  // runApp(const LocalStorageApp());
  runApp(const UserBdApp());
}
