import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;

  String? _validateEmail(value) {
    if (value == '') {
      return 'Введите email';
    }

    if (!validateEmail(value)) {
      return 'Поле email заполнено не корректно';
    }
    return null;
  }

  String? _validateSimpleField(value) {
    if (value == '') {
      return 'Заполните поле';
    }
    return null;
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                key: const Key('fieldName'),
                decoration: const InputDecoration(labelText: 'First name'),
                validator: _validateSimpleField,
              ),
              TextFormField(
                key: const Key('fieldLastName'),
                decoration: const InputDecoration(labelText: 'Last name'),
                validator: _validateSimpleField,
              ),
              TextFormField(
                key: const Key('fieldPhone'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: _validateSimpleField,
              ),
              TextFormField(
                key: const Key('fieldEmail'),
                decoration: const InputDecoration(labelText: 'Email'),
                validator: _validateEmail,
              ),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: const Text('Отправить'),
              ),
              if (_isSuccess) const Text('Вы успешно зарегистрировались')
            ],
          ),
        ));
  }
}
