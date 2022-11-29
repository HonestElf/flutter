import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:module_business/module_business.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    // _mainBloc = BlocFactory.instance.get<MainBloc>();
    _mainBloc = GetIt.I.get<MainBloc>();
    _mainBloc.add(const MainBlocEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return Provider<MainBloc>(
        create: (context) => _mainBloc,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }

  @override
  void dispose() {
    _mainBloc.dispose();
    super.dispose();
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
    return StreamBuilder<MainBlocState>(
      stream: context.read<MainBloc>().state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data;
          return state!.map(
              loading: (value) => Scaffold(
                    appBar: AppBar(
                      title: const Text('Demo'),
                    ),
                    body: const Center(child: Text('Initialization')),
                  ),
              loaded: (value) => Scaffold(
                    appBar: AppBar(
                      title: const Text('Demo'),
                    ),
                    body: Center(
                        child: Text(
                      '${state.userData.name}',
                      style: Theme.of(context).textTheme.headline4,
                    )),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () => context.read<MainBloc>().add(
                          MainBlocEvent.setUser(userId: state.userData.id + 1)),
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
