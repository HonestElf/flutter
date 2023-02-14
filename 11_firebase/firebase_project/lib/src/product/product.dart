// Flutter imports:
import 'package:flutter/material.dart';

const bName = 'name';
const bSelected = 'selected';

class Product {
  final String name;
  final bool selected;

  const Product({required this.name, required this.selected});

  factory Product.fromjson(Map<String, Object?> json) =>
      Product(name: json[bName] as String, selected: json[bSelected] as bool);

  Map<String, Object?> toJson() => {bName: name, bSelected: selected};
}

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(product.name),
          Text(product.selected ? 'selected' : 'not selected')
        ],
      ),
    );
  }
}
