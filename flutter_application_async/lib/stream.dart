import 'dart:async';

Stream<int> intStream(count) async* {
  for (var i = 0; i < count; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

StreamController<String> controller = StreamController<String>();
Stream stream = controller.stream;

StreamController<String> bradcastedController =
    StreamController<String>.broadcast();
Stream broadcastedStream = bradcastedController.stream;
