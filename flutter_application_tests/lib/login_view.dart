import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool successMessage = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submitForm() {
    setState(() {
      successMessage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              if (successMessage == true)
                const Text('Вы успешно зарегистрировались'),
              TextFormField(
                key: const Key('fieldEmail'),
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                key: const Key('fieldPhone'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              ElevatedButton(
                  onPressed: _submitForm, child: const Text('Submit'))
            ],
          )),
    );
  }
}
