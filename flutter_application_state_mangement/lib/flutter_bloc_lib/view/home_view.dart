// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:flutter_application_state_mangement/flutter_bloc_lib/actions/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/flutter_bloc_lib/bloc/games_bloc.dart';
import 'package:flutter_application_state_mangement/flutter_bloc_lib/model/games_repository.dart';
import 'package:flutter_application_state_mangement/flutter_bloc_lib/model/state.dart';
import 'package:flutter_application_state_mangement/flutter_bloc_lib/view/item_card.dart';

class FlutterBlocLibraryApp extends StatelessWidget {
  const FlutterBlocLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<GamesCatalogBloc>(
          create: (context) => GamesCatalogBloc(const ConstGamesRepository()),
          child: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
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
  void initState() {
    super.initState();

    context.read<GamesCatalogBloc>().add(InitGamesList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesCatalogBloc, GamesCatalogState>(
      builder: (context, state) {
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
                        BlocBuilder<GamesCatalogBloc, GamesCatalogState>(
                          builder: (_, state) {
                            if (state.gamesInCart.isNotEmpty) {
                              return Positioned(
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
                                  ));
                            } else {
                              return const SizedBox();
                            }
                          },
                        )
                      ],
                    )),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                children: <Widget>[
                  ...state.allGAmes
                      .map((game) => ItemCard(
                            item: game,
                            pressHandler: () => context
                                .read<GamesCatalogBloc>()
                                .add(AddItemToCart(game)),
                          ))
                      .toList()
                ],
              ),
            ));
      },
    );
  }
}
