import 'package:flutter/material.dart';
import 'package:flutter_application_multiplatform/src/adaptive_app/products_mock.dart';

class ProductList extends StatelessWidget {
  final int currentProductIndex;
  final void Function(int) onProductTap;
  const ProductList(
      {super.key,
      required this.currentProductIndex,
      required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          color: index == currentProductIndex
              ? Colors.lightBlueAccent
              : Colors.white,
          child: ListTile(
            title: Text(product.title),
            subtitle: Text(product.type),
            trailing: Text(product.price.toString()),
            onTap: () {
              onProductTap(index);
            },
          ),
        );
      },
    );
  }
}
