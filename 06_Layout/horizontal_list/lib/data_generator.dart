import 'package:flutter/material.dart';

List<Widget> _getTextData(int length) => List<Widget>.generate(length, (index) {
      return Text(
        index.toString(),
      );
    }, growable: false);

final textData = _getTextData(100);

List<Widget> _getGeneratedData(int length) =>
    List<Widget>.generate(length, (index) {
      return Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: ListTile(
          title: Text(index.toString()),
        ),
      );
    }, growable: false);

final generatedData = _getGeneratedData(100);
