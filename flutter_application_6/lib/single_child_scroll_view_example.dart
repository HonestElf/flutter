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
  final ScrollController controller = ScrollController();

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
      child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [for (final item in generatedData) item],
          )),
    ));
  }
}
