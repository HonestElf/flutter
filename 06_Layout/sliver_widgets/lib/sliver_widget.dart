import 'package:flutter/material.dart';

import 'package:sliver_widgets/data_generator.dart';

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
    return Material(
      child: SafeArea(
          child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
              expandedHeight: 200,
              floating: false,
              backgroundColor: Colors.blue,
              pinned: true,
              flexibleSpace: Stack(children: [
                FlexibleSpaceBar(
                    background: Image.network(
                  'https://picsum.photos/500/800',
                  fit: BoxFit.cover,
                )),
                Positioned(
                    child: Container(
                  color: Colors.black.withOpacity(0.2),
                )),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Collapsing Toolbar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ])),
          SliverList(
              delegate: SliverChildListDelegate([
            for (var item in textData)
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                child: item,
              )
          ]))
        ]),
      )),
    );
  }
}
