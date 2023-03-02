import 'package:flutter/material.dart';
import 'package:flutter_dev_tools/src/memory_leaks.dart';
import 'package:flutter_dev_tools/src/products/product_list.dart';
import 'package:flutter_dev_tools/src/products/products_mock.dart';

List<Map<String, dynamic>> tabsList = [
  {
    'id': 1,
    'title': 'All',
  },
  {
    'id': 2,
    'title': 'Favourite',
  },
  {
    'id': 3,
    'title': 'Memory leaks',
  },
];

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  // final List<Map<String, dynamic>> allGames = [];
  List<Product> _allProducts = [];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabsList.length, vsync: this);
    setState(() {
      _allProducts = rawProducts
          .map((product) => Product(
              title: product["title"],
              type: product["type"],
              description: product["description"],
              price: product["price"],
              rating: product["rating"],
              image: product["imagePath"],
              isFavourite: product["isFavourite"] ?? false))
          .toList();
    });
  }

  void toggleFavourite(String title) {
    setState(() {
      _allProducts = _allProducts.map((product) {
        if (product.title == title) {
          return Product(
              title: product.title,
              type: product.type,
              description: product.description,
              price: product.price,
              rating: product.rating,
              image: product.image,
              isFavourite: !product.isFavourite);
        }
        return product;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProductList(productList: _allProducts, clickHandler: toggleFavourite),
          ProductList(
              clickHandler: toggleFavourite,
              productList: _allProducts
                  .where((element) => element.isFavourite)
                  .toList()),
          Center(
            child: MemoryLeaksScreen(),
          )
        ],
      ),
    );
  }
}
