// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:hotels/models/hotel.dart';

class HotelPreviewCard extends StatelessWidget {
  final HotelPreview hotel;
  const HotelPreviewCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
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
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 152, 146, 146),
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(0, 1))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(0), bottom: Radius.circular(15)),
            ),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(hotel.name),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/details',
                            arguments: {'uuid': hotel.uuid});
                      },
                      child: const Text('Подробнее'))
                ]),
          )
        ],
      ),
    );
  }
}

class HotelPreviewSmallCard extends StatelessWidget {
  final HotelPreview hotel;
  const HotelPreviewSmallCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 75,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${hotel.poster}'),
                    fit: BoxFit.fill),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15), bottom: Radius.circular(0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: Text(
                hotel.name,
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
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/details', arguments: {'uuid': hotel.uuid});
                  },
                  child: const Text('Подробнее')),
            ),
          ],
        ),
      ),
    );
  }
}
