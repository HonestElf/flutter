import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  List<File> _imageGallery = [];
  File? file;
  late Directory appDocDir;

  @override
  void initState() {
    super.initState();

    _initStorage();
  }

  _initStorage() async {
    appDocDir = await getApplicationDocumentsDirectory();

    appDocDir.list().forEach((file) {
      print('FILES: ${file.path}');
    });
  }

  void _saveImage() async {
    print('URL: ${_urlController.text}');
    print('NAME: ${_textEditingController.text}');

    file = await downloadFile(_urlController.text, _textEditingController.text);

    // List<File> images = appDocDir.list().map((file) {
    //   return File(file.path);
    // });
// final String = appDocDir.

// List<File> images = appDocDir.list().map

//     setState(() {
//       _imageGallery = images;
//     });
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
            if (file != null)
              Container(height: 100, child: Image.file(File(file!.path)))
            // Expanded(
            //     child: _imageGallery.isEmpty
            //         ? const Center(child: Text('No images'))
            //         : ListView.builder(
            //             itemCount: _imageGallery.length,
            //             itemBuilder: (context, index) {
            //               return Image.file(
            //                 File(_imageGallery[index].path),
            //                 fit: BoxFit.cover,
            //               );
            //             },
            //           ))
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
