import 'package:firebase_project/src/product/product.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            ...productsList.map((item) => ListTile(
                  title: Text(item['name']),
                  subtitle:
                      Text(item['selected'] ? 'selected' : 'not selected'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add to cart'),
                  ),
                ))
          ],
        ));
  }
}
