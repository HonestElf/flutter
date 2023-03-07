import 'package:flutter/material.dart';
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
  // final TextEditingController _firstNameController = TextEditingController();
  // final TextEditingController _secondNameController = TextEditingController();
  // final TextEditingController _ageController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _cardNumber = TextEditingController();

  final GlobalKey<FormState> _userForm = GlobalKey<FormState>();

  AppDatabase? _database;
  List<User> _users = [];

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

  void _addPerson() async {
    print('PERSON ADDED with ${_userForm.currentState}');
  }

  void _openAddMenu() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, top: 40),
          child: Container(
            color: Colors.blueGrey[100],
            // height: 160,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _userForm,
                  child: Column(
                    children: [
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter some text';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(hintText: 'Ivan')),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter some text';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Ivanov',
                          )),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(hintText: '42')),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: '88005553535',
                          )),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: '1234 5678 9123 4567',
                          )),
                      ElevatedButton(
                        onPressed: () {
                          if (_userForm.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Adding person')),
                            );
                            _addPerson();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Добавить'),
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
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text('${_users[index].id}-${_users[index].firstName}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}
