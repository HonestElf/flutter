import 'package:flutter/material.dart';
import 'package:flutter_persistance_data/src/floor_app/database/database.dart';
import 'package:flutter_persistance_data/src/floor_app/entities/entity_person.dart';

class FloorApp extends StatelessWidget {
  const FloorApp({super.key});

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
  AppDatabase? _database;
  List<Person> _persons = [];

  @override
  void initState() {
    super.initState();

    _initDatabse();
  }

  void _initDatabse() async {
    _database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final personDao = _database!.personDao;

    _persons = await personDao.findAllPersons();

    setState(() {});
  }

  void _insertPerson(Person person) async {
    await _database!.personDao.insertPerson(person);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _persons.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
          child: Text('${_persons[index].id} - ${_persons[index].name}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _insertPerson(Person(2, 'Adam'));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
