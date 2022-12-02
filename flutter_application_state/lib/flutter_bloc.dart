import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increase }

class CounterBloc extends Bloc<CounterEvent, int> {
  int value = 0;

  CounterBloc() : super(0) {
    on<CounterEvent>(
      (event, emit) {
        if (event == CounterEvent.increase) {
          value++;
          emit(value);
        }
      },
    );
  }
}

class FlutterBlocApp extends StatelessWidget {
  const FlutterBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => CounterBloc(),
          child: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
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
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) => Text(
                state.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterBloc>().add(CounterEvent.increase),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
