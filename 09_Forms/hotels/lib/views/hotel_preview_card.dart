import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';

class HotelPreviewCard extends StatelessWidget {
  final HotelPreview hotel;
  const HotelPreviewCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              spreadRadius: 5,
              offset: Offset(5, 5))
        ],
        color: Colors.transparent,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/${hotel.poster}'),
                  fit: BoxFit.fill),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15), bottom: Radius.circular(0)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(0), bottom: Radius.circular(15)),
            ),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(hotel.name),
                  ElevatedButton(onPressed: () {}, child: const Text('More'))
                ]),
          )
        ],
      ),
    );
  }
}
