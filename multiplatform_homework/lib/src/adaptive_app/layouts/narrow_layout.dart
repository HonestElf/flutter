import 'package:flutter/material.dart';
import 'package:multiplatform_homework/src/adaptive_app/product_list.dart';

class NarrowLayout extends StatelessWidget {
  final String title;
  final int currentProductIndex;
  final void Function(int) onProductTap;
  const NarrowLayout(
      {super.key,
      this.title = 'App title',
      required this.currentProductIndex,
      required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ProductList(
        currentProductIndex: currentProductIndex,
        onProductTap: (index) {
          onProductTap(index);
        },
      ),
    );
  }
}
