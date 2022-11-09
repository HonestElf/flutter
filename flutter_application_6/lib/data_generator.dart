import 'package:flutter/material.dart';
import 'package:flutter_application_6/simple_card.dart';

List<Widget> _getGeneratedData(int length) =>
    List<Widget>.generate(length, (index) {
      return Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          title: Text('Строка № $index'),
        ),
      );
    }, growable: false);

final generatedData = _getGeneratedData(100);

List<Widget> _getSimpleCardData(int length) =>
    List<Widget>.generate(length, (index) {
      return SimpleCard(index: index.toString());
    }, growable: false);

final simpleCardData = _getSimpleCardData(100);

List<Widget> _getTextData(int length) => List<Widget>.generate(length, (index) {
      return Text(
        index.toString(),
      );
    }, growable: false);

final textData = _getTextData(100);
