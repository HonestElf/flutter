import 'package:flutter/material.dart';

class InheritedWidgetApp extends StatelessWidget {
  const InheritedWidgetApp({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TextStyleTheme(
          theme: TextTheme(fontSize: 16, color: Colors.black),
          child: Builder(
            builder: (innerContext) => Column(children: [
              Text(
                'First text',
                style: TextStyle(
                    fontSize: TextStyleTheme.of(innerContext).fontSize,
                    color: TextStyleTheme.of(innerContext).color),
              ),
              Text(
                'Second text',
                style: TextStyle(
                    fontSize: TextStyleTheme.of(innerContext).fontSize,
                    color: TextStyleTheme.of(innerContext).color),
              ),
              TextStyleTheme(
                  theme: TextTheme(fontSize: 32, color: Colors.blueAccent),
                  child: Builder(
                    builder: (innerContext) => Text(
                      'Third text',
                      style: TextStyle(
                          fontSize: TextStyleTheme.of(innerContext).fontSize,
                          color: TextStyleTheme.of(innerContext).color),
                    ),
                  )),
              Text(
                'Fourth text',
                style: TextStyle(
                    fontSize: TextStyleTheme.of(innerContext).fontSize,
                    color: TextStyleTheme.of(innerContext).color),
              ),
              const CombinedWidget()
            ]),
          )),
    );
  }
}

class TextStyleTheme extends InheritedWidget {
  final TextTheme theme;

  const TextStyleTheme({Key? key, required this.theme, required Widget child})
      : super(key: key, child: child);

  static TextTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<TextStyleTheme>();
    assert(result != null, 'No TextStyleTheme found in context');
    return result!.theme;
  }

  @override
  bool updateShouldNotify(TextStyleTheme oldWidget) => theme != oldWidget.theme;
}

class TextTheme {
  final double fontSize;
  final Color color;

  TextTheme({required this.fontSize, required this.color});
}

class CombinedWidget extends StatefulWidget {
  const CombinedWidget({super.key});

  @override
  State<CombinedWidget> createState() => _CombinedWidgetState();
}

class _CombinedWidgetState extends State<CombinedWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: MediaQuery.of(context).size.width < 720
          ? Container(
              child: const Text(longText),
            )
          : const Center(
              child: SizedBox(
                width: 600,
                child: Text(longText),
              ),
            ),
    );
  }
}

const longText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
