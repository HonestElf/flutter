import 'package:flutter/material.dart';
import 'package:multiplatform_homework/src/adaptive_app/products_mock.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(product.image),
                )),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      product.type,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: Text(
                        product.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rating: ${product.rating} / 5',
                      style: const TextStyle(fontSize: 20, color: Colors.green),
                    )
                  ],
                ))
          ]),
    );
  }
}
