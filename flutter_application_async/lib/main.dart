import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter_application_async/future.dart';
import 'package:flutter_application_async/stream.dart';

void main() async {
  // futureApi();
  // asyncApi();
  // intStream(5).listen((value) {
  //   print(value);
  // });

  var _stream = intStream(5).where((value) => value > 2);
  await for (var item in _stream) {
    print(item);
  }

  controller.add('Point 1');
  controller.add('Point 2');
  controller.add('Point 3');

  // stream.listen((value) {
  //   print('from controller $value');
  // });

  StreamSubscription streamSubscription = stream.listen((value) {
    print('from controller $value');
  });

//Error
  // StreamSubscription streamSubscription2 = stream.listen((value) {
  //   print('from controller $value');
  // });

  streamSubscription.cancel();

  bradcastedController.add('Event 1');
  bradcastedController.add('Event 2');
  bradcastedController.add('Event 3');

  StreamSubscription streamBroadSubscription1 =
      broadcastedStream.listen((value) {
    print('from controller $value');
  });

  StreamSubscription streamBroadSubscription2 =
      broadcastedStream.listen((value) {
    print('from controller $value');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Stream<int> getRandomValue(int count) async* {
//     var random = Random(2);

//     while (count > 0) {
//       count -= 1;

//       await Future.delayed(const Duration(seconds: 1));
//       yield random.nextInt(100);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: StreamBuilder(
//         stream: getRandomValue(7),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               return const Center(
//                 child: Text('NONE'),
//               );

//             case ConnectionState.waiting:
//               return const Center(child: CircularProgressIndicator());

//             case ConnectionState.active:
//               return Center(
//                 child: Text('${snapshot.data}'),
//               );

//             case ConnectionState.done:
//               return const Center(
//                 child: Text('DONE'),
//               );

//             default:
//               return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       // body: FutureBuilder(
//       //   future: fetchFileFromAssets('assets/data.txt'),
//       //   builder: (BuildContext context, AsyncSnapshot snapshot) {
//       //     switch (snapshot.connectionState) {
//       //       case ConnectionState.waiting:
//       //         return const Center(child: CircularProgressIndicator());

//       //       case ConnectionState.active:
//       //         return const Center(child: CircularProgressIndicator());

//       //       case ConnectionState.done:
//       //         return SingleChildScrollView(
//       //           child: Text(snapshot.data),
//       //         );

//       //       default:
//       //         return const Center(child: CircularProgressIndicator());
//       //     }
//       //   },
//       // )
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<int> getRandomValue(int count) async* {
    var random = Random(2);

    while (count > 0) {
      count -= 1;

      await Future.delayed(const Duration(seconds: 1));
      yield random.nextInt(100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[Text('aaaaaaa')],
        ));
  }
}
