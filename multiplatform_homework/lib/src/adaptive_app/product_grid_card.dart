import 'package:flutter/material.dart';
import 'package:multiplatform_homework/src/adaptive_app/adaprive_bottom_sheet.dart';
import 'package:multiplatform_homework/src/adaptive_app/products_mock.dart';
import 'package:popover/popover.dart';

class ProductGridCard extends StatelessWidget {
  final int index;
  final int currentProductIndex;
  final Product product;
  final void Function(int) onProductTap;
  const ProductGridCard(
      {super.key,
      required this.index,
      required this.product,
      required this.currentProductIndex,
      required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onProductTap(index);
        showPopover(
          context: context,
          width: 200,
          bodyBuilder: (context) => AdaptiveBottomSheet(index: index),
        );
      },
      child: Card(
        color: index == currentProductIndex
            ? Colors.lightBlueAccent
            : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(product.image),
            ),
            Text(product.title),
            Text(product.type)
          ],
        ),
      ),
    );
  }
}
