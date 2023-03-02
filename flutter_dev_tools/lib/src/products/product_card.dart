import 'package:flutter/material.dart';
import 'package:flutter_dev_tools/src/products/products_mock.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final void Function(String) clickHandler;
  const ProductCard(
      {super.key, required this.product, required this.clickHandler});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 50,
        backgroundImage:
            // ResizeImage(height: 262, width: 147, AssetImage(product.image)),
            ResizeImage(
                height: 262,
                width: 147,
                NetworkImage(
                    'https://picsum.photos/${product.price + 200}/300')),
        // AssetImage(product.image),
      ),
      title: Text(product.title),
      subtitle: Text(product.type),
      trailing: SizedBox(
        width: 100,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(product.price.toString()),
          IconButton(
              icon: Icon(Icons.star,
                  color: product.isFavourite ? Colors.yellow : Colors.grey),
              onPressed: () {
                clickHandler(product.title);
              }),
        ]),
      ),
      onTap: () {},
    );
  }
}
