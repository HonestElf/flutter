import 'package:flutter/material.dart';
import 'package:flutter_persistance_data/src/drift_app/table/todos_table.dart';

class DriftApp extends StatelessWidget {
  const DriftApp({super.key});

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
  late MyDataBase _database;

  @override
  void initState() {
    super.initState();
    _database = MyDataBase();
  }

  void _addTodo(Todo todo) async {
    await _database.insertTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<Todo>>(
        initialData: [],
        stream: _database.todoStream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(16),
                child: Text(
                    '${snapshot.data![index].title}-${snapshot.data![index].content}')),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodo(Todo(
              id: 1, title: 'Todoshechka', content: 'To-do, to-do, to-dooo'));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
