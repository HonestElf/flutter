import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

part 'todos_table.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();
}

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Todos, Categories])
class MyDataBase extends _$MyDataBase {
  MyDataBase() : super(_openConnection());

  Future<List<Todo>> get allTodoEntries => select(todos).get();
  Future<int> insertTodo(Todo todo) =>
      into(todos).insert(todo, mode: InsertMode.insertOrReplace);
  Stream<List<Todo>> get todoStream => select(todos).watch();
  Stream<List<Category>> get categoriesStream => select(categories).watch();

  @override
  int get schemaVersion => 1;
}
