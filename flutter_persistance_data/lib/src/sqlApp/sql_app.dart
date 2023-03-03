import 'package:flutter/material.dart';
import 'package:flutter_persistance_data/src/sqlApp/model/model_dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlApp extends StatelessWidget {
  const SqlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Database? db;

  @override
  void initState() {
    super.initState();

    _initializeDatabase();
  }

  void _initializeDatabase() async {
    db =
        await openDatabase(join(await getDatabasesPath(), 'doggie_database.db'),
            onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    }, version: 1);

    setState(() {});
  }

  Future<void> insertDog(Dog dog) async {
    await db!.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    setState(() {});
  }

  Future<void> updateDogs(Dog dog) async {
    await db!.update('dogs', dog.toMap(), where: 'id=?', whereArgs: [dog.id]);
    setState(() {});
  }

  Future<void> deleteDog(int id) async {
    await db!.delete('dogs', where: 'id=?', whereArgs: [id]);
    setState(() {});
  }

  Future<void> executeCommand() async {
    final result = await db!.rawQuery('SELECT name from dogs');
    setState(() {});
  }

  Future<List<Dog>> dogs() async {
    final List<Map<String, dynamic>> maps = await db!.query('dogs');

    return List.generate(maps.length, (index) {
      return Dog(
          id: maps[index]['id'],
          name: maps[index]['name'],
          age: maps[index]['age']);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (db == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: dogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final dog = snapshot.data![index];
              return Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${dog.id}-${dog.name}-${dog.age}'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                insertDog(Dog(id: 1, name: 'Sharik', age: 1));
              }),
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                insertDog(Dog(id: 2, name: 'Bobic', age: 3));
              }),
          FloatingActionButton(
              child: const Icon(Icons.delete),
              onPressed: () {
                deleteDog(1);
              }),
          FloatingActionButton(
              child: const Icon(Icons.edit),
              onPressed: () {
                updateDogs(Dog(id: 2, name: 'Tuzik', age: 3));
              }),
        ],
      ),
    );
  }
}
