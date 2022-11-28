import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

class DetailedView extends StatelessWidget {
  const DetailedView({super.key, required this.data});
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Hero(tag: data.id, child: Image.asset(data.image)),
                  Positioned(
                      top: 20,
                      right: 20,
                      child: Hero(
                          tag: '${data.id}-button',
                          child: Material(
                              child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.blue[200],
                            child: const Icon(Icons.add),
                          )))),
                ],
              ),
            ),
            Hero(
                tag: '${data.id}-title',
                child: Material(
                  child: Text(data.description),
                )),
          ],
        ),
      )),
    );
  }
}
