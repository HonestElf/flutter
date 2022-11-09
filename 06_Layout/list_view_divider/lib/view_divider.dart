import 'package:flutter/material.dart';

import 'package:list_view_divider/data_generator.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listData = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: textData.map((item) => item).toList()[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(thickness: 1),
                  itemCount: textData.length))
        ],
      ),
    ));
  }
}
