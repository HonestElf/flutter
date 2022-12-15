import 'package:flutter/material.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/product_detail.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/product_list.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/products_mock.dart';

class NarrowLayout extends StatelessWidget {
  final int currentProductIndex;
  final void Function(int) onProductTap;
  const NarrowLayout(
      {super.key,
      required this.currentProductIndex,
      required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return ProductList(
      currentProductIndex: currentProductIndex,
      onProductTap: (index) {
        onProductTap(index);

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(),
              body: ProductDetail(product: products[index]),
            );
          },
        ));
      },
    );
  }
}
