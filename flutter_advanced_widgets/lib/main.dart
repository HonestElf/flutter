import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  int _counter = 0;
  bool _isFirstVisible = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _isFirstVisible = !_isFirstVisible;
    });
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
            // const RotatedWidget(),
            // const ScalableWidget(),
            // const TranslatedWidget(),
            const BaseTransformWidget(),
            _isFirstVisible
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: CustomStatelessWidget(text: 'Hello'),
                  )
                : const Padding(
                    padding: EdgeInsets.all(16),
                    child: CustomStatelessWidget(text: 'World'),
                  ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomStatelessWidget extends StatelessWidget {
  final String text;

  const CustomStatelessWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) => RichText(
      text: TextSpan(text: text, style: DefaultTextStyle.of(context).style));
}

class RotatedWidget extends StatefulWidget {
  const RotatedWidget({super.key});

  @override
  State<RotatedWidget> createState() => _RotatedWidgetState();
}

class _RotatedWidgetState extends State<RotatedWidget> {
  double _transform = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: _transform / 5,
        transformHitTests: true,
        child: GestureDetector(
          onHorizontalDragUpdate: (update) {
            setState(() {
              _transform += update.delta.dx;
            });
          },
          child: const SizedBox(
            width: 200,
            height: 200,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class ScalableWidget extends StatefulWidget {
  const ScalableWidget({super.key});

  @override
  State<ScalableWidget> createState() => ScalableWidgetState();
}

class ScalableWidgetState extends State<ScalableWidget> {
  double _transform = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: _transform / 5,
        transformHitTests: true,
        child: GestureDetector(
          onHorizontalDragUpdate: (update) {
            setState(() {
              _transform += update.delta.dx;
            });
          },
          child: const SizedBox(
            width: 200,
            height: 200,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class TranslatedWidget extends StatefulWidget {
  const TranslatedWidget({super.key});

  @override
  State<TranslatedWidget> createState() => TranslatedWidgetState();
}

class TranslatedWidgetState extends State<TranslatedWidget> {
  double _transform = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(_transform, 0),
        transformHitTests: true,
        child: GestureDetector(
          onHorizontalDragUpdate: (update) {
            setState(() {
              _transform += update.delta.dx;
            });
          },
          child: const SizedBox(
            width: 200,
            height: 200,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class BaseTransformWidget extends StatefulWidget {
  const BaseTransformWidget({super.key});

  @override
  State<BaseTransformWidget> createState() => BaseTransformWidgetState();
}

class BaseTransformWidgetState extends State<BaseTransformWidget> {
  double _transform = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(_transform / 20),
        transformHitTests: true,
        alignment: Alignment.center,
        child: GestureDetector(
          onHorizontalDragUpdate: (update) {
            setState(() {
              _transform += update.delta.dx;
            });
          },
          child: const SizedBox(
            width: 200,
            height: 200,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
