import 'package:flutter/material.dart';
import 'package:multiplatform_homework/src/adaptive_app/product_grid_card.dart';
import 'package:multiplatform_homework/src/adaptive_app/products_mock.dart';

class ProductsGrid extends StatelessWidget {
  final int currentProductIndex;
  final void Function(int) onProductTap;
  const ProductsGrid(
      {super.key,
      required this.currentProductIndex,
      required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.8,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 3,
      children: [
        ...products.asMap().entries.map((entry) {
          int index = entry.key;
          Product product = entry.value;
          return ProductGridCard(
            index: index,
            currentProductIndex: currentProductIndex,
            onProductTap: onProductTap,
            product: product,
          );
        })
      ],
    );
  }
}
