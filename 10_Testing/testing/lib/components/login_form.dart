import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool successMessage = false;

  String? _validateEmail(value) {
    if (value == '') {
      return 'Введите email';
    }

    if (!validateEmail(value)) {
      return 'Поле email заполнено не корректно';
    }
    return null;
  }

  String? _validatePhone(value) {
    if (value == '') {
      return 'Введите номер телефона';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: const Key('fieldEmail'),
            validator: _validateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            key: const Key('fieldPhone'),
            validator: _validatePhone,
            decoration: const InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          ElevatedButton(
            child: const Text('Отправить'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  successMessage = true;
                });
              }
            },
          ),
          if (successMessage) const Text('Добро пожаловать'),
        ],
      ),
    );
  }
}
