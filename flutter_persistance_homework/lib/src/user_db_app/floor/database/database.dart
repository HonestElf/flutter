import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_persistance_homework/src/user_db_app/floor/dao/dao_user.dart';
import 'package:flutter_persistance_homework/src/user_db_app/floor/entity/entity_user.dart';

part 'database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
