import 'package:flutter/material.dart';
import 'package:flutter_integration/src/event_channel/service.dart';

class EventChannelApp extends StatelessWidget {
  const EventChannelApp({super.key});

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
  final _service = PlatformService();
  int _counter = 0;

  void _getValue() async {
    _counter = await _service.callMethodChannel();

    setState(() {
      _counter = _counter;
    });
  }

  void _getStream() async {
    _service.callEventChannel().listen((event) {
      print('STREAM: $event');
      setState(() {
        _counter = event;
      });
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
              'Value from platform: ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _getValue,
            tooltip: 'Random',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _getStream,
            tooltip: 'Stream',
            child: const Icon(Icons.forward),
          ),
        ],
      ),
    );
  }
}
