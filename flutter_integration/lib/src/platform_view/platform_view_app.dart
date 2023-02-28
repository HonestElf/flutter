import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_integration/src/platform/platform_view_mobile.dart';
import 'package:flutter_integration/src/platform_view/service.dart';

class PlatformViewApp extends StatelessWidget {
  const PlatformViewApp({super.key});

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
  int _counter = 0;
  StreamSubscription? _subscription;
  final service = PlatformService();

  void _getValue() async {
    _counter = await service.callMethodChannel();

    setState(() {
      _counter = _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Ui component from platform:',
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: PlatformWidget(),
              ),
            ),
            Text('Stream from platform:'),
            StreamBuilder<int>(
              stream: service.getStream(),
              builder: (context, snapshot) =>
                  Text('${snapshot.hasData ? snapshot.data : "No data"}'),
            ),
            Text('Value from platform:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getValue,
        child: const Icon(Icons.get_app),
      ),
    );
  }
}
