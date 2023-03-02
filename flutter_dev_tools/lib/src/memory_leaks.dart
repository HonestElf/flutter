import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryLeakObject {
  final String text;

  MemoryLeakObject(this.text);
}

List<MemoryLeakObject> leakObjects = [];

class MemoryLeaksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          child: const Text(
            'Create 1 000 000 leaks',
          ),
          onPressed: () {
            while (leakObjects.length < 1000000) {
              leakObjects.add(
                MemoryLeakObject('Count: ${leakObjects.length}'),
              );
            }
          },
        ),
      ),
    );
  }
}
