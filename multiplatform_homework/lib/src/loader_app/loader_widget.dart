import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final TextEditingController fileNameController;
  final void Function() loadTapHandler;
  const LoaderWidget(
      {super.key,
      required this.fileNameController,
      required this.loadTapHandler});

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
              controller: fileNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter SRC',
              ),
            ),
          ),
          ElevatedButton(onPressed: loadTapHandler, child: const Text('Load'))
        ],
      ),
    );
  }
}
