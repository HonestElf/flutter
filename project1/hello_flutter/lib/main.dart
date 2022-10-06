import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            title: Text('My first App'),
            centerTitle: true,
          ),
          body: Center(
              child: Text(
            'This is home page',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ))),
      // Center(
      //   child: Text(
      //     'hello Flutter'.toUpperCase(),
      //     textDirection: TextDirection.ltr,
      //     style: TextStyle(
      //         fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
      //   ),
      // )
    ),
  );
}
