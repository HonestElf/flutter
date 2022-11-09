// Flutter imports:
import 'package:flutter/material.dart';

import 'package:flutter_application_6/data_generator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController controller = ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      print('Offset: ${controller.offset}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Collapsing Toolbar',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              background: Image.network(
                'https://picsum.photos/500/800',
                fit: BoxFit.cover,
              ),
            ),
          ),
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
