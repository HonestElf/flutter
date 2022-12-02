// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:flutter_application_state_mangement/api/api.dart';
import 'package:flutter_application_state_mangement/provider_app/item.dart';
import 'package:flutter_application_state_mangement/provider_app/item_card.dart';

class GamesCatalog with ChangeNotifier {
  bool isLoading = true;
  List<GameItem> gameItems = [];
  List<GameItem> gamesInCart = [];

  void initList(List<GameItem> list) {
    isLoading = false;
    gameItems = list;
    notifyListeners();
  }

  void addItemToCart(GameItem item) {
    gamesInCart.add(item);
    notifyListeners();
  }
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GamesCatalog>(
      create: (context) => GamesCatalog(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    getAllGames();
  }

  getAllGames() async {
    try {
      final contextAction = context.read<GamesCatalog>();
      final response = await getItems();

      List<GameItem> games =
          response.map<GameItem>((json) => GameItem.formJson(json)).toList();

      contextAction.initList(games);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 207, 202, 202),
        appBar: AppBar(
          title: const Text('App bar'),
          actions: [
            Consumer<GamesCatalog>(
              builder: (context, value, child) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Center(
                        child: Icon(Icons.shopping_basket_outlined),
                      ),
                      value.gamesInCart.isNotEmpty
                          ? Positioned(
                              right: -5,
                              top: 9,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  context
                                      .read<GamesCatalog>()
                                      .gamesInCart
                                      .length
                                      .toString(),
                                ),
                              ))
                          : const SizedBox()
                    ],
                  )),
            )
          ],
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Consumer<GamesCatalog>(
              builder: (context, state, child) => state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      children: <Widget>[
                        ...state.gameItems
                            .map((game) => ItemCard(item: game))
                            .toList()
                      ],
                    ),
            )));
  }
}
