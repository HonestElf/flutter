// Flutter imports:
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                    focusNode: _focus,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        color: Colors.purple,
                        Icons.search,
                      ),
                      labelStyle: const TextStyle(color: Colors.purple),
                      labelText: 'Search',
                      helperText: 'Поле для поиска заметок',
                      hintText: 'Введите значение',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple)),
                    )),
              )
            ],
          ),
        )));
  }
}
