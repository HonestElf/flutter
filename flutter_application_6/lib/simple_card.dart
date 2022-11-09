import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget {
  final String index;
  const SimpleCard({Key? key, required this.index}) : super(key: key);

  @override
  SimpleCardState createState() => SimpleCardState();
}

class SimpleCardState extends State<SimpleCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    print('init ${widget.index}');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose ${widget.index}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
          child: ListTile(
        trailing: Icon(
          Icons.favorite,
          color: _isFavorite ? Colors.red : Colors.black12,
        ),
        title: Text(widget.index),
        onTap: (() {
          setState(() {
            _isFavorite = !_isFavorite;
          });
        }),
      )),
    );
  }
}
