import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MySecondApp());

class MySecondApp extends StatefulWidget {
  const MySecondApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MySecondAppState();
  }
}

class _MySecondAppState extends State<MySecondApp> {
  bool _loading = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: const Text('StateFull widget'),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(16),
                child: _loading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LinearProgressIndicator(
                            value: _progressValue,
                          ),
                          Text(
                            '${(_progressValue * 100).round()}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        'Press button to download',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ))),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: const Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);

    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        print('_progressValue: ,$_progressValue');
        _progressValue += 0.2;

        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
