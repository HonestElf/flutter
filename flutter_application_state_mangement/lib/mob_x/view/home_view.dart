// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_application_state_mangement/mob_x/model/item.dart';
import 'package:flutter_application_state_mangement/mob_x/actions/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/mob_x/model/state.dart';

// Package imports:

// Project imports:
import 'package:flutter_application_state_mangement/mob_x/view/item_card.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MobXApp extends StatelessWidget {
  const MobXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => GamesCatalogState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            "/": (context) {
              return MyHomePage(
                title: 'Flutter Demo Home Page',
              );
            }
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<GamesCatalogState>(context);
    return Observer(
      builder: (
        context,
      ) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
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
                        state.gamesInCart.isNotEmpty
                            ? Positioned(
                                right: -5,
                                top: 9,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    state.gamesInCart.length.toString(),
                                  ),
                                ))
                            : const SizedBox()
                      ],
                    )),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      children: <Widget>[
                        ...state.allGAmes
                            .map((game) => ItemCard(
                                  item: game,
                                  pressHandler: () => state.addItemToCart(game),
                                ))
                            .toList()
                      ],
                    ),
            ));
      },
    );
  }
}
