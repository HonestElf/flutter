import 'package:flutter/material.dart';
import 'package:flutter_application_forms/dio_request.dart';
// import 'package:flutter_application_forms/http_request.dart';

void main() {
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
      // home: const HttpHomePage(title: 'Flutter Demo Home Page'),
      home: const DioHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
