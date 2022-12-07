// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// Project imports:
import 'package:flutter_application_state_mangement/redux/actions/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/redux/middleware/store_middleware.dart';
import 'package:flutter_application_state_mangement/redux/model/item.dart';
import 'package:flutter_application_state_mangement/redux/model/state.dart';
import 'package:flutter_application_state_mangement/redux/view/item_card.dart';

// Package imports:


class ReduxApp extends StatelessWidget {
  ReduxApp({super.key});
  final store = Store<GamesCatalogState>(appReducer,
      initialState: GamesCatalogState.initial(),
      middleware: createStoreMiddleware());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<GamesCatalogState>(
        store: store,
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
                  onInit: () {
                    StoreProvider.of<GamesCatalogState>(context)
                        .dispatch(InitGamesList());
                  });
            }
          },
        ));
  }
}

class _ViewModel {
  final GamesCatalogState state;

  final VoidCallback onInit;
  final void Function(GameItem item) onAddItemToCart;

  _ViewModel({
    required this.state,
    required this.onInit,
    required this.onAddItemToCart,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.onInit});

  final void Function() onInit;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GamesCatalogState, _ViewModel>(
      converter: (store) {
        return _ViewModel(
            state: store.state,
            onInit: () => store.dispatch(InitGamesList()),
            onAddItemToCart: (item) => store.dispatch(AddItemToCart(item)));
      },
      builder: (context, _ViewModel vm) {
        if (vm.state.isLoading) {
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
                        vm.state.gamesInCart.isNotEmpty
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
                                    vm.state.gamesInCart.length.toString(),
                                  ),
                                ))
                            : const SizedBox()
                      ],
                    )),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: vm.state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      children: <Widget>[
                        ...vm.state.allGAmes
                            .map((game) => ItemCard(
                                  item: game,
                                  pressHandler: () => vm.onAddItemToCart(game),
                                ))
                            .toList()
                      ],
                    ),
            ));
      },
    );
  }
}
