import 'package:flutter/material.dart';
import 'dart:async';

enum CounterEvent { increase }

class CounterBloc {
  int value = 0;

  final _stateController = StreamController<int>();
  final _eventController = StreamController<CounterEvent>();

  Stream<int> get state => _stateController.stream;
  Sink<CounterEvent> get action => _eventController.sink;

  CounterBloc() {
    _eventController.stream.listen(_handleEvent);
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }

  void _handleEvent(CounterEvent action) async {
    if (action == CounterEvent.increase) {
      value++;
    }

    _stateController.add(value);
  }
}

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});

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
  State<MyHomePage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomePage> {
  late final CounterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CounterBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
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
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: bloc.state,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data?.toString() ?? '',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.action.add(CounterEvent.increase),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
