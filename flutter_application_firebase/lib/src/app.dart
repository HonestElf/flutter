import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/src/user.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final _users = <User>[];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    _users.add(User(name: 'Sasha', amount: 100));
    _users.add(User(name: 'Vasya', amount: 200));
  }

  void _submit() {
    if (_nameController.text != '') {
      setState(() {
        _users.add(User(
            name: _nameController.text,
            amount: int.parse(
                _amountController.text != '' ? _amountController.text : '0')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView(
                children: [
                  ..._users
                      .map((user) => ListTile(
                            leading: Text(user.name),
                            trailing: Text('${user.amount}\$'),
                          ))
                      .toList()
                ],
              )),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Flexible(
                        flex: 3,
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(hintText: 'Name'),
                        )),
                    Flexible(
                        flex: 1,
                        child: TextField(
                          controller: _amountController,
                          decoration: const InputDecoration(hintText: 'amount'),
                        )),
                    ElevatedButton(onPressed: _submit, child: Text('Submit'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
