import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_persistance_homework/src/storage_app/get_image.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageApp extends StatelessWidget {
  const LocalStorageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();

  final ValueNotifier<List<File>> _imageGallery = ValueNotifier<List<File>>([]);
  File? file;
  late Directory appDocDir;

  @override
  void initState() {
    super.initState();

    _initStorage();
  }

  _initStorage() async {
    appDocDir = await getApplicationDocumentsDirectory();
    final Directory temp = Directory('${appDocDir.path}/downloads');

    if (await temp.exists()) {
      temp.list().forEach((file) async {
        if (await file.exists()) {
          _imageGallery.value = [..._imageGallery.value, File(file.path)];
        }
      });
    }
  }

  void _saveImage() async {
    //https://picsum.photos/200

    if (_urlController.text.isEmpty || _textEditingController.text.isEmpty) {
      print('Target url or file name missing');
      return;
    }

    try {
      final bytes = await downloadFiles(_urlController.text) as Uint8List;

      String prunedName =
          '${_textEditingController.text.replaceAll(' ', '')}.jpg';

      Directory targetDir = Directory('${appDocDir.path}/downloads');

      await checkIfDirExist(targetDir);

      File file = File('${targetDir.path}/$prunedName');

      await file.writeAsBytes(bytes);

      if (await file.exists()) {
        _imageGallery.value = [..._imageGallery.value, file];
        _urlController.clear();
        _textEditingController.clear();
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> checkIfDirExist(Directory targetDir) async {
    if (!(await targetDir.exists())) {
      await targetDir.create();
    }
  }

  @override
  void dispose() {
    _imageGallery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration:
                  const InputDecoration(hintText: 'https://example.com'),
            ),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(hintText: 'MyAwesomeFile'),
            ),
            ValueListenableBuilder(
              valueListenable: _imageGallery,
              builder: (context, images, child) {
                if (images.isEmpty) {
                  return const Center(child: Text('No images'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200,
                          height: 150,
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: Image.file(
                              File(images[index].path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveImage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
