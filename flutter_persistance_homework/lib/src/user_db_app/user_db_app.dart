import 'package:flutter/material.dart';
import 'package:flutter_persistance_homework/src/user_db_app/components/user_card.dart';
import 'package:flutter_persistance_homework/src/user_db_app/floor/database/database.dart';
import 'package:flutter_persistance_homework/src/user_db_app/floor/entity/entity_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  Map<String, dynamic> _formValues = {};

  FlutterSecureStorage? storage;

  @override
  void initState() {
    super.initState();

    _initDatabase();

    storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
  }

  void _initDatabase() async {
    _database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final userDao = _database!.userDao;

    _users = await userDao.getAllUsers();

    setState(() {});
  }

  void _editUser(int userId) async {
    final User user = User(
      id: userId,
      firstName: _formValues['firstName'],
      secondName: _formValues['secondName'],
      age: int.parse(_formValues['age']),
      phone: _formValues['phone'],
    );

    await _database!.userDao.updateUser(user);

    storage!.write(
        key: '${userId}_card_number_key', value: _formValues['cardNumber']);

    _users = await _database!.userDao.getAllUsers();
    setState(() {
      _formValues = {};
    });
  }

  void _addNewUser() async {
    final uniqueId = UniqueKey().hashCode;

    final User user = User(
      id: uniqueId,
      firstName: _formValues['firstName'],
      secondName: _formValues['secondName'],
      age: int.parse(_formValues['age']),
      phone: _formValues['phone'],
    );

    await _database!.userDao.addUser(user);

    storage!.write(
        key: '${uniqueId}_card_number_key', value: _formValues['cardNumber']);

    _users = await _database!.userDao.getAllUsers();
    setState(() {
      _formValues = {};
    });
  }

  void _deleteUser(User user) async {
    await _database!.userDao.deleteUser(user);

    storage!.delete(key: '${user.id}_card_number_key');

    _users = await _database!.userDao.getAllUsers();
    setState(() {});
  }

  void _openForm(User? user, String? userCard) {
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
                padding: const EdgeInsets.all(16),
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
                        initialValue: userCard ?? '',
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

                            if (user != null) {
                              _editUser(user.id);
                            } else {
                              _addNewUser();
                            }

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
                  final user = _users[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FutureBuilder(
                      future: storage!.read(key: '${user.id}_card_number_key'),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return UserCard(
                              user: _users[index],
                              cardNumber: snapshot.data!,
                              deleteUser: _deleteUser,
                              editUser: _openForm);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openForm(null, null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
