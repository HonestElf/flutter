// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_application_state_mangement/fish_redux/model/item.dart';

class ItemCard extends StatefulWidget {
  final GameItem item;

  final Function pressHandler;
  const ItemCard({super.key, required this.item, required this.pressHandler});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool _isInCart = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        // height: 150,
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
                    image: AssetImage('assets/images/${widget.item.image}'),
                    fit: BoxFit.contain),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15), bottom: Radius.circular(0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Text(
                widget.item.name,
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
                  onPressed: _isInCart
                      ? null
                      : () {
                          widget.pressHandler();
                          setState(() {
                            _isInCart = true;
                          });
                        },
                  child: Text(_isInCart ? 'В корзине' : 'В корзину')),
            ),
          ],
        ),
      ),
    );
  }
}
