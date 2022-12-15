// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:http/http.dart' as http;

class SrcLoaderApp extends StatelessWidget {
  const SrcLoaderApp({super.key});

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
  String _htmlText = '';

  Future<void> _loadHtmlPage() async {
    final result = await http.get(Uri.parse('https://flutter.dev/'));

    setState(() {
      _htmlText = result.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Text(_htmlText),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadHtmlPage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
