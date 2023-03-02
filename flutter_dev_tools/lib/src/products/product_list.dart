import 'package:flutter/material.dart';
import 'package:flutter_dev_tools/src/products/product_card.dart';
import 'package:flutter_dev_tools/src/products/products_mock.dart';

class ProductList extends StatelessWidget {
  const ProductList(
      {super.key, required this.productList, required this.clickHandler});
  final void Function(String) clickHandler;

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return productList.isEmpty
        ? const Center(child: Text('No products yet'))
        : ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: productList[index],
                clickHandler: clickHandler,
              );
            },
          );
  }
}
