// Flutter imports:
import 'package:flutter/material.dart';
import 'package:multiplatform_homework/src/adaptive_app/adaprive_bottom_sheet.dart';
import 'package:multiplatform_homework/src/adaptive_app/layouts/adaprive_controller.dart';
import 'package:multiplatform_homework/src/adaptive_app/layouts/narrow_layout.dart';
import 'package:multiplatform_homework/src/adaptive_app/layouts/wide_layout.dart';

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

  _onItemTapNarrow(index) {
    setState(() {
      _currentProductIndex = index;
    });
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) {
        return AdaptiveBottomSheet(index: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveController(
      narrow: NarrowLayout(
        title: widget.title,
        currentProductIndex: _currentProductIndex,
        onProductTap: _onItemTapNarrow,
      ),
      wide: WideLayout(
        title: widget.title,
        currentProductIndex: _currentProductIndex,
        onProductTap: _onProductTap,
      ),
    );
  }
}
