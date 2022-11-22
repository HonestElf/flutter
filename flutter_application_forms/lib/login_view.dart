// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_forms/user.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fieldNameController = TextEditingController();
  final TextEditingController _fieldEmailController = TextEditingController();

  // Dio _dio = Dio();

  void _submitForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      User user = User(
          '1231',
          _fieldNameController.text,
          'Username field',
          _fieldEmailController.text,
          UserAddress(
              'user streer', 'user zipcode', 'user City', 'user suite'));

      print(user.toJson());
      // _dio.post('user')
      form.save();
      form.reset();
    }
  }

  String? _validateEmail(value) {
    if (value == '') {
      return 'Заполните Email';
    } else {
      return null;
    }
  }

  String? _validateName(value) {
    if (value == '') {
      return 'Заполните имя';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login view'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _fieldNameController,
                validator: _validateName,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                validator: _validateEmail,
                controller: _fieldEmailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              ElevatedButton(
                  onPressed: _submitForm, child: const Text('Submit form'))
            ],
          )),
    );
  }
}
