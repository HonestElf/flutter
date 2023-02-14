// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Project imports:
import 'package:firebase_project/src/auth/authentication.dart';
import 'package:firebase_project/src/product/product.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: ElevatedButton(
                    onPressed: signIn,
                    child: const Text('Вход'),
                  ),
                ),
              );
            } else {
              return MyHomePage();
            }
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CollectionReference<Product> _products;
  final TextEditingController _nameController = TextEditingController();

  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();

    _products = FirebaseFirestore.instance
        .collection('products')
        .withConverter<Product>(
          fromFirestore: (snapshot, options) =>
              Product.fromjson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  void addNewProduct() {
    if (_nameController.text != '') {
      _products
          .doc(_nameController.text)
          .set(Product(name: _nameController.text, selected: false));
      _nameController.text = '';
    }
  }

  void toggleProduct(Product item) {
    _products
        .doc(item.name)
        .set(Product(name: item.name, selected: !item.selected));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: storage.ref('bgImage.jpg').getDownloadURL(),
        builder: (context, snapshot) {
          final downloaded = snapshot.connectionState == ConnectionState.done;
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: downloaded
                        ? NetworkImage(snapshot.data!)
                        : NetworkImage(''),
                    opacity: 0.3,
                    alignment: Alignment.center,
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<List<Product>>(
                      stream: _products.snapshots().map(
                          (event) => event.docs.map((e) => e.data()).toList()),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? ListView(
                                children: snapshot.data!
                                    .map((product) => ListTile(
                                          title: Text(product.name),
                                          subtitle: Text(product.selected
                                              ? 'selected'
                                              : 'not selected'),
                                          trailing: ElevatedButton(
                                            onPressed: () =>
                                                toggleProduct(product),
                                            child: product.selected
                                                ? Icon(Icons.check)
                                                : Icon(Icons.add),
                                          ),
                                        ))
                                    .toList())
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: TextField(
                            controller: _nameController,
                            decoration:
                                const InputDecoration(hintText: 'Продукт'),
                          )),
                      ElevatedButton(
                          onPressed: addNewProduct,
                          child: const Text('Добавить'))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
