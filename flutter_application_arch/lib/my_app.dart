// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:module_business/module_business.dart';
// import 'package:provider/provider.dart';

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late final MainBloc _mainBloc;

//   @override
//   void initState() {
//     super.initState();

//     // _mainBloc = BlocFactory.instance.get<MainBloc>();
//     //added injectable
//     _mainBloc = GetIt.I.get<MainBloc>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Provider<MainBloc>(
//       create: (context) => _mainBloc,
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     context.read<MainBloc>().add(0);
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// added freezed and module_model

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
    // _mainBloc = BlocFactory.instance.get<MainBloc>();

    //added injectable
    // _mainBloc = GetIt.I.get<MainBloc>();

    // added freezed and module_model
    _mainBloc = GetIt.I.get<MainBloc>();
    _mainBloc.add(const MainBlocEvent.init());
    super.initState();
  }

  @override
  void dispose() {
    _mainBloc.dispose();
    super.dispose();
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
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MainBlocState>(
      stream: context.read<MainBloc>().state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data;
          return state!.map<Widget>(
            loading: (value) => Scaffold(
                appBar: AppBar(
                  title: const Text('Loadin state'),
                ),
                body: const Center(
                  child: Text('Initialization'),
                )),
            loaded: (value) => Scaffold(
              appBar: AppBar(
                title: const Text('Loaded state'),
              ),
              body: Center(
                  child: Text(
                '${state.userData.name}',
                style: Theme.of(context).textTheme.headline4,
              )),
              floatingActionButton: FloatingActionButton(
                onPressed: () => context
                    .read<MainBloc>()
                    .add(MainBlocEvent.setUser(userId: state.userData.id + 1)),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
