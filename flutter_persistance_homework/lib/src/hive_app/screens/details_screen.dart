import 'package:flutter/material.dart';
import 'package:flutter_persistance_homework/src/hive_app/hive_item/hive_item.dart';
import 'package:hive_flutter/adapters.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = 'detailsScreen';
  const DetailsScreen(
      {super.key, required this.itemName, required this.boxName});

  final String? itemName;
  final String? boxName;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Box<CategoryItem>? _itemBox;

  @override
  void initState() {
    super.initState();

    if (widget.boxName != null) {
      _initializeHive();
    }
  }

  void _initializeHive() {
    Hive.openBox<CategoryItem>(widget.boxName!).then((value) {
      setState(() {
        _itemBox = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details screen'),
      ),
      body: Center(
          child: _itemBox == null
              ? const Center(child: CircularProgressIndicator())
              : ValueListenableBuilder(
                  valueListenable: _itemBox!.listenable(),
                  builder: (context, box, child) {
                    final currentItem = box.values.singleWhere(
                        (element) => element.name == widget.itemName);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(currentItem.name),
                        Text(currentItem.description)
                      ],
                    );
                  },
                )),
    );
  }
}
