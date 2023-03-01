import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  final Map<String, dynamic> creationParams;
  const PlatformWidget({super.key, required this.creationParams});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 200,
      child: Text('Platform is not supported'),
    );
  }
}
