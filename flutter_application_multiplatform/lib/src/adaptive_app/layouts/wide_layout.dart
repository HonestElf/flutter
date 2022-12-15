import 'package:flutter/material.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/product_detail.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/product_list.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/products_mock.dart';

class WideLayout extends StatelessWidget {
  final int currentProductIndex;
  final void Function(int) onProductTap;
  const WideLayout(
      {super.key,
      required this.currentProductIndex,
      required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ProductList(
              currentProductIndex: currentProductIndex,
              onProductTap: onProductTap),
        ),
        Expanded(
            flex: 3,
            child: ProductDetail(product: products[currentProductIndex]))
      ],
    );
  }
}
