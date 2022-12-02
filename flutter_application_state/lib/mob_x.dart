import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'mob_x_state.dart';

enum Actions { increment }

int counterReducer(int state, dynamic action) {
  if (action == Actions.increment) {
    return state + 1;
  }

  return state;
}

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}

class MobXApp extends StatelessWidget {
  const MobXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ExampleState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ExampleState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Observer(
                builder: (context) {
                  return Text(
                    state.value.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: state.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
