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
    return Scaffold(
      appBar: AppBar(title: const Text('App Bar')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(labelText: 'Search'),
          ),
          Expanded(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double width = constraints.constrainWidth();

              print(width);

              return width > 500
                  ? ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        ...generatedData
                            .map((item) => Container(
                                  width: 100,
                                  child: item,
                                ))
                            .toList()
                      ],
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, childAspectRatio: 2),
                      itemBuilder: (context, index) => generatedData[index],
                      itemCount: generatedData.length,
                    );
            },
          )

              //   Container(
              //     child: ListView(
              //       controller: _controller,
              //       scrollDirection: Axis.horizontal,
              //       children: <Widget>[
              //         ...generatedData
              //             .map((item) => Container(
              //                   width: 100,
              //                   child: item,
              //                 ))
              //             .toList()
              //       ],
              //     ),
              //   ),
              // )
              // Expanded(
              //     child: Container(
              //         height: 200,
              //         child: ListView(
              //           controller: _controller,
              //           scrollDirection: Axis.horizontal,
              //           children: generatedData.map((item) => item).toList(),
              //         )))
              )
        ],
      ),
    );
  }
}
