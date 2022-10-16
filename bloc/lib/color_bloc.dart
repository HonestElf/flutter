import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { event_red, event_green }

class ColorBloc {
  Color _color = Colors.red;

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _ouputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _ouputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.event_red) {
      _color = Colors.red;
    } else if (event == ColorEvent.event_green) {
      _color = Colors.green;
    } else {
      throw Exception('Wrong Event State');
    }
    _ouputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _ouputStateController.close();
  }
}
