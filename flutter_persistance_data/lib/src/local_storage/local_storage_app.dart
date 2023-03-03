import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageApp extends StatelessWidget {
  const LocalStorageApp({super.key});

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
  late TextEditingController _controller;
  late File file;

  void _saveProgress() {
    file.writeAsString(_controller.text);
  }

  void _initialize() async {
    final appDocDir = await getApplicationDocumentsDirectory();

    file = File('${appDocDir.path}/file_name.txt');

    if (await file.exists()) {
      // _controller.text = await file.readAsString();
      _controller.text = (await file.readAsBytes()).join(' ');
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        color: Colors.white, backgroundColor: Colors.blue))),
                onPressed: _saveProgress,
                child: const Text('save'))
          ],
        ),
      ),
    );
  }
}
