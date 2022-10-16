import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Building layouts'),
          centerTitle: true,
        ),
        body: Align(
          alignment: Alignment.center,
          // alignment: Alignment(0.5, 0.5),
          //alignment:  Alignment.topCenter,
          child: Text(
            'Hello Flutter',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      // Padding(
      //   padding: EdgeInsets.only(left: 50, top: 60),
      //   child: Text(
      //     'Hello Flutter',
      //     style: TextStyle(fontSize: 30),
      //   ),
      // )),
    );
  }
}
