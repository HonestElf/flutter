import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/state.dart';
import 'package:flutter_application_state_mangement/fish_redux/view/item_card.dart';

Widget catalogPageView(
    GamesCatalogState state, Dispatch dispatch, ViewService viewService) {
  return state.isLoading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : Scaffold(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                              pressHandler: () => dispatch(
                                    ActionsCreate.addItemToCart(game),
                                  )))
                          .toList()
                    ],
                  ),
          ));
}
