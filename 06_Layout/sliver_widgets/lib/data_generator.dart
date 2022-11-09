import 'package:flutter/material.dart';

List<Widget> _getTextData(int length) => List<Widget>.generate(length, (index) {
      return Text(
        index.toString(),
      );
    }, growable: false);

final textData = _getTextData(100);
