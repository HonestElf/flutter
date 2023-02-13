import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/src/product/product.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bgImage.jpg'),
                opacity: 0.3,
                alignment: Alignment.center,
                fit: BoxFit.cover)),
        child: Column(
          children: [
            FutureBuilder(
              future: storage.ref('bgImage.jpg').getDownloadURL(),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.done
                      ? Image.network(snapshot.data!, fit: BoxFit.scaleDown)
                      : const SizedBox(),
            ),
            Expanded(
              child: StreamBuilder<List<Product>>(
                  stream: _products
                      .snapshots()
                      .map((event) => event.docs.map((e) => e.data()).toList()),
                  builder: (context, snapshot) {
                    return ListView(
                      children: snapshot.hasData
                          ? snapshot.data!
                              .map((product) => ListTile(
                                    title: Text(product.name),
                                    subtitle: Text(product.selected
                                        ? 'selected'
                                        : 'not selected'),
                                    trailing: ElevatedButton(
                                      onPressed: () => toggleProduct(product),
                                      child: product.selected
                                          ? Icon(Icons.check)
                                          : Icon(Icons.add),
                                    ),
                                  ))
                              .toList()
                          : [Text('Data not found')],
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
                        decoration: const InputDecoration(hintText: 'Продукт'),
                      )),
                  ElevatedButton(
                      onPressed: addNewProduct, child: const Text('Добавить'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
