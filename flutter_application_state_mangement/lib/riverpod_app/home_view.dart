// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_application_state_mangement/api/api.dart';
import 'package:flutter_application_state_mangement/riverpod_app/item.dart';
import 'package:flutter_application_state_mangement/riverpod_app/item_card.dart';
import 'package:flutter_application_state_mangement/riverpod_app/provider.dart';

class RiverpodApp extends StatelessWidget {
  const RiverpodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RiverpodHome(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class RiverpodHome extends ConsumerStatefulWidget {
  const RiverpodHome({super.key, required this.title});

  final String title;

  @override
  ConsumerState<RiverpodHome> createState() => RiverpodHomeState();
}

class RiverpodHomeState extends ConsumerState<RiverpodHome> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getAllGames();
  }

  getAllGames() async {
    try {
      final contextAction = ref.watch(gamesCatalogProvider.notifier);
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
    final catalogState = ref.watch(gamesCatalogProvider);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 207, 202, 202),
        appBar: AppBar(
          title: const Text('App bar'),
          actions: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Center(
                      child: Icon(Icons.shopping_basket_outlined),
                    ),
                    catalogState.gamesInCart.isNotEmpty
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
                                catalogState.gamesInCart.length.toString(),
                              ),
                            ))
                        : const SizedBox()
                  ],
                )),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: catalogState.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    ...catalogState.gameItems
                        .map((game) => ItemCard(item: game))
                        .toList()
                  ],
                ),
        ));
  }
}