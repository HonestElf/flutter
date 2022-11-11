// Flutter imports:
import 'package:flutter/material.dart';

import 'package:horizontal_list/data_generator.dart';

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
    return SafeArea(child: Scaffold(body: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.constrainWidth();

        print(width);

        return ListView(
          scrollDirection: width > 500 ? Axis.vertical : Axis.horizontal,
          children: <Widget>[
            ...generatedData
                .map((item) => Container(
                      width: 80,
                      child: item,
                    ))
                .toList()
          ],
        );
      },
    )
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: <Widget>[
        //     Expanded(child: LayoutBuilder(
        //       builder: (BuildContext context, BoxConstraints constraints) {
        //         double width = constraints.constrainWidth();

        //         print(width);

        //         return ListView(
        //           scrollDirection: width > 500 ? Axis.vertical : Axis.horizontal,
        //           children: <Widget>[
        //             ...generatedData
        //                 .map((item) => Container(
        //                       height: width > 500 ? 20 : 50,
        //                       width: 100,
        //                       child: item,
        //                     ))
        //                 .toList()
        //           ],
        //         );
        //       },
        //     ))
        //   ],
        // ),
        ));
  }
}
