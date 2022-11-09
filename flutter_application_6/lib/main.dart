// Flutter imports:
import 'package:flutter/material.dart';

// import 'package:flutter_application_6/single_child_scroll_view_example.dart'
//     as ScrollView;
// import 'package:flutter_application_6/list_view_example.dart' as list_view;
import 'package:flutter_application_6/sliver_list.dart' as sliver_list;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const sliver_list.MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
