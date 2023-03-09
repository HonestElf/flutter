import 'package:flutter/material.dart';
import 'package:flutter_persistance_homework/src/user_db_app/components/user_card.dart';
import 'package:flutter_persistance_homework/src/user_db_app/floor/database/database.dart';
import 'package:flutter_persistance_homework/src/user_db_app/floor/entity/entity_user.dart';

class UserBdApp extends StatelessWidget {
  const UserBdApp({super.key});

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
  final GlobalKey<FormState> _userForm = GlobalKey<FormState>();

  AppDatabase? _database;
  List<User> _users = [];

  final Map<String, dynamic> _formValues = {};

  @override
  void initState() {
    super.initState();

    _initDatabase();
  }

  void _initDatabase() async {
    _database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final userDao = _database!.userDao;

    _users = await userDao.getAllUsers();

    setState(() {});
  }

  void _handleUser(bool isEditing) async {
    final User user = User(
        firstName: _formValues['firstName'],
        secondName: _formValues['secondName'],
        age: int.parse(_formValues['age']),
        phone: _formValues['phone'],
        cardNumber: _formValues['cardNumber']);

    if (isEditing) {
      await _database!.userDao.updateUser(user);
    } else {
      await _database!.userDao.addUser(user);
    }

    _users = await _database!.userDao.getAllUsers();
    setState(() {});
  }

  void _deleteUser(User user) async {
    await _database!.userDao.deleteUser(user);

    _users = await _database!.userDao.getAllUsers();
    setState(() {});
  }

  void _openForm(User? user) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, top: 40),
          child: Container(
            color: Colors.blueGrey[100],
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _userForm,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: user != null ? user.firstName : '',
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(hintText: 'Ivan'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter some text';
                          }
                          _formValues.putIfAbsent('firstName', () => value);
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: user != null ? user.secondName : '',
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: 'Ivanov',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter some text';
                          }
                          _formValues.putIfAbsent('secondName', () => value);
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: user != null ? user.age.toString() : '',
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: '42'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter number';
                          }
                          _formValues.putIfAbsent('age', () => value);
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: user != null ? user.phone : '',
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: '88005553535',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter number';
                          }
                          _formValues.putIfAbsent('phone', () => value);
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: user != null ? user.cardNumber : '',
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '1234 5678 9123 4567',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter number';
                          }
                          _formValues.putIfAbsent('cardNumber', () => value);
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_userForm.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(user != null
                                      ? 'Editing user'
                                      : 'Adding user}')),
                            );

                            _handleUser(user != null);

                            Navigator.pop(context);
                          }
                        },
                        child: Text(user != null ? 'Изменить' : 'Добавить'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _users.isEmpty
          ? const Center(
              child: Text('No users yet'),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: UserCard(
                        user: _users[index],
                        deleteUser: _deleteUser,
                        editUser: _openForm),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openForm(null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
