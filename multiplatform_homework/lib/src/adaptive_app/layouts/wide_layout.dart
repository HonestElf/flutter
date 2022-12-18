import 'package:flutter/material.dart';
import 'package:multiplatform_homework/src/adaptive_app/adaptive_grid.dart';

class WideLayout extends StatelessWidget {
  final String title;
  final int currentProductIndex;
  final void Function(int) onProductTap;
  const WideLayout(
      {super.key,
      this.title = 'App title',
      required this.currentProductIndex,
      required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.cyan,
            child: Column(
              children: [Text(title)],
            ),
          ),
        ),
        Expanded(
            flex: 3,
            child: ProductsGrid(
              currentProductIndex: currentProductIndex,
              onProductTap: onProductTap,
            ))
      ],
    ));
  }
}
