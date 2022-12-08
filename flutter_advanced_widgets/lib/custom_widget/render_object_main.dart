import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderObjectApp extends StatelessWidget {
  const RenderObjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Render object'),
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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tint(
                color: Colors.red,
                child: Text('You have pushed the button this many times:'))
          ],
        )));
  }
}

class Tint extends SingleChildRenderObjectWidget {
  final Color color;

  const Tint({super.key, required this.color, required Widget child})
      : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTint(color: color);
  }
}

class RenderTint extends RenderProxyBox {
  Color _color;

  RenderTint({Color color = Colors.transparent, RenderBox? child})
      : _color = color,
        super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.drawColor(_color, BlendMode.srcOver);

    if (child != null) {
      context.paintChild(child!, offset);
      context.paintChild(child!, Offset(offset.dx + 100, offset.dy + 100));
    }
  }
}
