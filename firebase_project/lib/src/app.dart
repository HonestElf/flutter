import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_project/src/user.dart';

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
  // final _users = <User>[];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  late CollectionReference<User> _users;

  @override
  void initState() {
    super.initState();

    // _users.add(const User(name: 'Sasha', amount: 100));
    // _users.add(const User(name: 'Vasya', amount: 200));

    _users = FirebaseFirestore.instance
        .collection('birthday')
        .withConverter<User>(
          fromFirestore: (snapshot, options) => User.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  void _submit() {
    if (_nameController.text != '') {
      // setState(() {
      //   _users.add(User(
      //       name: _nameController.text,
      //       amount: int.parse(
      //           _amountController.text != '' ? _amountController.text : '0')));
      // });

      _users.add(User(
          name: _nameController.text,
          amount: int.parse(_amountController.text)));
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
                  child: StreamBuilder<List<User>>(
                      stream: _users.snapshots().map(
                          (event) => event.docs.map((e) => e.data()).toList()),
                      builder: (context, snapshot) {
                        return ListView(
                            children: snapshot.hasData
                                ? snapshot.data!
                                    .map((user) => ListTile(
                                          leading: Text(user.name),
                                          trailing: Text('${user.amount}\$'),
                                        ))
                                    .toList()
                                : []);
                      })),
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
                    ElevatedButton(
                        onPressed: _submit, child: const Text('Submit'))
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
