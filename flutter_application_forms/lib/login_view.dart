import 'package:flutter/material.dart';
import 'package:flutter_application_forms/user.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fieldNameController = TextEditingController();
  TextEditingController _fieldEmailController = TextEditingController();
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

      // print('Form Submitted');
      // print('name: ${_fieldNameController.text}');
      // print('email: ${_fieldEmailController.text}');
    }
  }

  String? _validateEmail(value) {
    if (value == '') {
      return 'Заполните Email';
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
                validator: ((value) {
                  if (value == '') {
                    return 'Заполните имя';
                  } else {
                    return null;
                  }
                }),
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
