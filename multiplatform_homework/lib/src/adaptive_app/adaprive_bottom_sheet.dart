import 'package:flutter/material.dart';

List<Map<String, dynamic>> _actionList = [
  {
    'title': const Text("View profile"),
    'icon': const Icon(Icons.person, size: 40),
    'onTap': (int index) {
      print('View profile tapped: $index');
    },
  },
  {
    'title': const Text("Friends"),
    'icon': const Icon(Icons.group, size: 40),
    'onTap': (int index) {
      print('Friends tapped: $index');
    },
  },
  {
    'title': const Text("Report"),
    'icon': const Icon(Icons.description, size: 40),
    'onTap': (int index) {
      print('Report tapped: $index');
    },
  }
];

class AdaptiveBottomSheet extends StatelessWidget {
  final int index;
  const AdaptiveBottomSheet({super.key, required this.index});

  void onTapHandler() {}

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      ..._actionList
          .map((action) => ListTile(
                leading: action['icon'],
                onTap: () {
                  action['onTap'](index);
                  Navigator.of(context).pop();
                },
                title: action['title'],
              ))
          .toList(),
    ]);
  }
}
