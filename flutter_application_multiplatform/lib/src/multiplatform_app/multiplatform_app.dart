// Flutter imports:
import 'package:flutter/material.dart';

import 'mock_web_view.dart'
    if (dart.library.io) 'non_web_platform_webview.dart'
    if (dart.library.html) 'web_platform_webview.dart';

class MultiplatformApp extends StatelessWidget {
  const MultiplatformApp({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: webView('https://flutter.dev/'));
  }
}
