import 'package:flutter/material.dart';
import 'package:flutter_persistance_homework/src/hive_app/hive_item/hive_item.dart';
import 'package:flutter_persistance_homework/src/hive_app/screens/details_screen.dart';
import 'package:hive_flutter/adapters.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = 'categoryScreen';

  const CategoryScreen({super.key, required this.currentCategory});
  final String? currentCategory;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Box<CategoryItem>? _itemBox;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _initializeHive();
  }

  void _initializeHive() {
    Hive.openBox<CategoryItem>('${widget.currentCategory}-ITEMS').then((value) {
      setState(() {
        _itemBox = value;
      });
    });
  }

  void _addItem() async {
    await _itemBox?.add(CategoryItem(
        name: _nameController.text, description: _descriptionController.text));
  }

  void _openDetails(String itemName) {
    Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: {
      'boxName': '${widget.currentCategory}-ITEMS',
      'itemName': itemName
    });
  }

  void openBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            color: Colors.blueGrey[100],
            height: 160,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                        controller: _nameController,
                        decoration:
                            const InputDecoration(hintText: 'Item name')),
                    TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Item description',
                        )),
                    ElevatedButton(
                      onPressed: () {
                        _addItem();
                        Navigator.pop(context);
                      },
                      child: const Text('Добавить'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category screen'),
      ),
      body: Center(
          child: _itemBox == null
              ? const Center(child: CircularProgressIndicator())
              : ValueListenableBuilder(
                  valueListenable: _itemBox!.listenable(),
                  builder: (context, box, child) {
                    return ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final item = box.values.elementAt(index);

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid),
                            ),
                            child: Center(
                                child: TextButton(
                              onPressed: () {
                                _openDetails(item.name);
                              },
                              child: Text(item.name),
                            )),
                          ),
                        );
                      },
                    );
                  },
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: openBottomSheet,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
