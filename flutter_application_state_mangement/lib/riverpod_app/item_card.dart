// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_application_state_mangement/riverpod_app/item.dart';
import 'package:flutter_application_state_mangement/riverpod_app/provider.dart';

class ItemCard extends ConsumerWidget {
  final GameItem item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogActions = ref.watch(gamesCatalogProvider.notifier);
    final catalogState = ref.watch(gamesCatalogProvider);
    bool isInCart = catalogState.gamesInCart.contains(item);
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${item.image}'),
                    fit: BoxFit.contain),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15), bottom: Radius.circular(0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            Container(
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(0), bottom: Radius.circular(15)),
                  ))),
                  onPressed: isInCart
                      ? null
                      : () {
                          catalogActions.addItemToCart(item);
                        },
                  child: Text(isInCart ? 'В корзине' : 'В корзину')),
            ),
          ],
        ),
      ),
    );
  }
}
