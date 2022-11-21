import 'package:flutter/material.dart';
import 'package:load_file/fetch_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Load file'),
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
  final TextEditingController _fileNameController = TextEditingController();

  bool isDataLoading = false;
  bool hasError = false;
  String? fileData;

  void getFileByName(String fileName) async {
    setState(() {
      isDataLoading = true;
    });
    try {
      final result = await fetchFileFromAssets('assets/${fileName}.txt');

      setState(() {
        fileData = result;
        hasError = false;
      });
    } catch (error) {
      setState(() {
        hasError = true;
      });
    }

    setState(() {
      isDataLoading = false;
    });
  }

  void onButtonPressed() {
    getFileByName(_fileNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _fileNameController,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3)),
                          labelText: 'File name',
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text('Find'),
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Text(_fileNameController.text),
              ),
              Expanded(
                  child: Center(
                child: isDataLoading
                    ? const CircularProgressIndicator()
                    : hasError
                        ? const Text('File not found')
                        : SingleChildScrollView(child: Text(fileData ?? '')),
              ))
            ],
          )),
    );
  }
}
