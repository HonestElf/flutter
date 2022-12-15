// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/layouts/adaprive_controller.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/layouts/narrow_layout.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/layouts/wide_layout.dart';

class AdaptiveApp extends StatelessWidget {
  const AdaptiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentProductIndex = 0;
  late void Function(int) _onProductTap;
  @override
  void initState() {
    super.initState();

    _onProductTap = (index) {
      setState(() {
        _currentProductIndex = index;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: AdaptiveController(
          narrow: NarrowLayout(
            currentProductIndex: _currentProductIndex,
            onProductTap: _onProductTap,
          ),
          wide: WideLayout(
            currentProductIndex: _currentProductIndex,
            onProductTap: _onProductTap,
          ),
        ));
  }
}
