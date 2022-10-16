import 'package:bloc/color_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter block demo',
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomepage> {
  ColorBloc _block = ColorBloc();

  @override
  void dispose() {
    _block.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloC with stream'),
        centerTitle: true,
      ),
      body: Center(
          child: StreamBuilder(
        stream: _block.outputStateStream,
        initialData: Colors.red,
        builder: (contex, snapshot) {
          print('context: $contex, snapshot: $snapshot');
          return AnimatedContainer(
            height: 100,
            width: 100,
            color: snapshot.data,
            duration: Duration(milliseconds: 500),
          );
        },
      )),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              _block.inputEventSink.add(ColorEvent.event_red);
            }),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              _block.inputEventSink.add(ColorEvent.event_green);
            }),
      ]),
    );
  }
}
