// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

class LifecycleApp extends StatelessWidget {
  const LifecycleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Widget lifecycle'),
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
  String text = DateTime.now().toString();
  bool isTextVisible = true;
  ThemeData _currentTheme = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Theme(
          data: _currentTheme,
          child: Center(
              child: Visibility(
            visible: isTextVisible,
            child: MyStatefulWidget(title: text),
          )),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  text = DateTime.now().toString();
                });
              },
              tooltip: 'Add text',
              child: const Icon(Icons.chair),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  isTextVisible = !isTextVisible;
                });
              },
              tooltip: 'Text visibility',
              child: const Icon(Icons.chair),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _currentTheme = ThemeData.dark();
                });
              },
              tooltip: 'change theme',
              child: const Icon(Icons.theater_comedy),
            ),
          ],
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key, required this.title});
  final String title;

  @override
  // ignore: no_logic_in_create_state
  State<MyStatefulWidget> createState() {
    print('[CREATE STATE] - called');
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
    print('[INIT STATE] - called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('[DID_CHANGE_DEPENDENCIES] - called');
  }

  @override
  void didUpdateWidget(covariant MyStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[DID_UPDATE] - called');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('[SET_DATET] - called');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('[MOUNTED] =  $mounted');
    print('[DEACTIVATE] - called');
    Timer(const Duration(seconds: 1), () {
      print('[MOUNTED] =  $mounted');
    });
  }

  @override
  void dispose() {
    print('[DISPOSE] - called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('[BUILD] - called');
    return GestureDetector(
      onTap: () {
        setState(() {
          _counter++;
        });
      },
      child: Text(
        '${widget.title} - $_counter',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
