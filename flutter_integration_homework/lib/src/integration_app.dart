import 'package:flutter/material.dart';
import 'package:flutter_integration_homework/src/platform/service.dart';
import 'package:flutter_integration_homework/src/platform/dummy/platform_view_dummy.dart'
    if (dart.library.io) 'package:flutter_integration_homework/src/platform/mobile/platform_view_mobile.dart';

class IntegrationApp extends StatelessWidget {
  const IntegrationApp({super.key});

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
  final TextEditingController _textEditingController = TextEditingController();
  ValueNotifier<String> _platformText = ValueNotifier('');

  final service = getService();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void setTextFromPlatform() async {
    final text = await service.getValue(_textEditingController.text);

    _platformText.value = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                controller: _textEditingController,
              ),
            ),
            const Text(
              'Ui component from platform:',
            ),
            ValueListenableBuilder(
              valueListenable: _platformText,
              builder: (context, value, child) => SizedBox(
                  height: 50,
                  child: _platformText.value.isEmpty
                      ? const SizedBox.shrink()
                      : PlatformWidget(
                          creationParams: {'text': _platformText.value})),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: setTextFromPlatform,
            child: const Icon(Icons.get_app),
          ),
        ],
      ),
    );
  }
}
