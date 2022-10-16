import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'IndieFlower'),
      home: Scaffold(
        appBar: AppBar(title: const Text('Adding Assets')),
        body: Center(
            child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo-background1.png'),
            ),
            Image.asset('assets/icons/bitcoin.png'),
            Positioned(
                top: 16,
                left: 115,
                child: Text(
                  'My custom font',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    // fontFamily: 'IndieFlower'
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
