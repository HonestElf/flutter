import 'package:flutter/material.dart';
import 'package:flutter_persistance_homework/src/hive_app/hive_item/hive_item.dart';
import 'package:flutter_persistance_homework/src/hive_app/screens/category_screen.dart';
import 'package:hive_flutter/adapters.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> with TickerProviderStateMixin {
  Box<HiveCategory>? _categoryBox;

  final TextEditingController _textEditingController = TextEditingController();

  void openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            color: Colors.blueGrey[100],
            height: 110,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: TextField(
                      controller: _textEditingController,
                      decoration:
                          const InputDecoration(hintText: 'Category name')),
                  trailing: ElevatedButton(
                    onPressed: () {
                      _addCategory();
                      Navigator.pop(context);
                    },
                    child: const Text('Добавить'),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _initializeHive();
  }

  void _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveCategoryAdapter());
    Hive.registerAdapter(CategoryItemAdapter());

    Hive.openBox<HiveCategory>('categories').then((value) {
      setState(() {
        _categoryBox = value;
      });
    });
  }

  void _addCategory() async {
    await _categoryBox?.add(HiveCategory(name: _textEditingController.text));
  }

  void _openCategory(String category) {
    Navigator.of(context)
        .pushNamed(CategoryScreen.routeName, arguments: {'category': category});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: Center(
          child: _categoryBox == null
              ? const Center(child: CircularProgressIndicator())
              : ValueListenableBuilder(
                  valueListenable: _categoryBox!.listenable(),
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
                                _openCategory(item.name);
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
