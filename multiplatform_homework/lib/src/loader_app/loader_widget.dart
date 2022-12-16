import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final void Function(String) changeHanler;
  final void Function() loadTapHandler;
  const LoaderWidget(
      {super.key, required this.changeHanler, required this.loadTapHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextField(
              onChanged: changeHanler,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter SRC',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                loadTapHandler();
              },
              child: const Text('Load'))
        ],
      ),
    );
  }
}
