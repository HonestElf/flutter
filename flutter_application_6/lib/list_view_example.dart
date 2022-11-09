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
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                child: const Text('Animate to'),
                onPressed: () {
                  controller.animateTo(500,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
              ),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                child: const Text('Jump to'),
                onPressed: () {
                  controller.jumpTo(2000);
                },
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(thickness: 1),
              itemCount: textData.map((item) => item).toList().length,
              controller: controller,
              itemBuilder: (context, index) =>
                  textData.map((item) => item).toList()[index],
            ),
          )
        ],
      ),
    ));
  }
}
