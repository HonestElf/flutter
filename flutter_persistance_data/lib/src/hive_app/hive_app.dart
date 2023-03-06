import 'package:flutter/material.dart';
import 'package:flutter_persistance_data/src/hive_app/person/person.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HiveApp extends StatelessWidget {
  const HiveApp({super.key});

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
  Box<Person>? _personBox;

  void _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonAdapter());

    Hive.openBox<Person>('persons').then((value) {
      setState(() {
        _personBox = value;
      });
    });
  }

  void _addRecord(String name, int age) async {
    _personBox?.add(Person(name: name, age: age));
  }

  void _renameRecord(String name, int age) async {
    final rec = _personBox!.values.first;

    rec.name = name;
    rec.age = age;

    rec.save();
  }

  void _removeFirst() async {
    if (_personBox!.values.isNotEmpty) {
      final rec = _personBox!.values.first;
      rec.delete();
    }
  }

  @override
  void initState() {
    super.initState();

    _initializeHive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: _personBox == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ValueListenableBuilder(
                  valueListenable: _personBox!.listenable(),
                  builder: (context, box, child) {
                    return ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final item = box.values.elementAt(index);
                        return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black26,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text('${item.name}-(${item.age})'),
                          ),
                        );
                      },
                    );
                  },
                )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _addRecord('Nikolay', 40),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => _renameRecord('Pete', 10),
            tooltip: 'Increment',
            child: const Icon(Icons.edit),
          ),
          FloatingActionButton(
            onPressed: () => _removeFirst(),
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
