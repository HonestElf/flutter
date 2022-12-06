// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_application_state_mangement/bloc_app/actions/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/bloc_app/bloc.dart/games_bloc.dart';
import 'package:flutter_application_state_mangement/bloc_app/model/games_repository.dart';
import 'package:flutter_application_state_mangement/bloc_app/model/state.dart';

// Package imports:

// Project imports:
import 'package:flutter_application_state_mangement/bloc_app/view/item_card.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

class _MyHomePageState extends State<MyHomePage> {
  late final GamesCatalogBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = GamesCatalogBloc(const ConstGamesRepository());
    bloc.action.add(InitGamesList());
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GamesCatalogState>(
      stream: bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
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
                        snapshot.data!.gamesInCart.isNotEmpty
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
                                    snapshot.data!.gamesInCart.length
                                        .toString(),
                                  ),
                                ))
                            : const SizedBox()
                      ],
                    )),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: snapshot.data!.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      children: <Widget>[
                        ...snapshot.data!.allGAmes
                            .map((game) => ItemCard(
                                  item: game,
                                  pressHandler: () =>
                                      bloc.action.add(AddItemToCart(game)),
                                ))
                            .toList()
                      ],
                    ),
            ));
      },
    );
  }
}
