import 'package:flutter/cupertino.dart';
import 'package:flutter_application_state_mangement/fish_redux/actions/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/fish_redux/model/item.dart';
import 'package:redux/redux.dart';

@immutable
class GamesCatalogState {
  final bool isLoading;
  final List<GameItem> allGAmes;
  final List<GameItem> gamesInCart;

  const GamesCatalogState(
      {this.isLoading = false,
      this.allGAmes = const [],
      this.gamesInCart = const []});

  factory GamesCatalogState.initial() => const GamesCatalogState();

  GamesCatalogState copyWith({
    final bool? isLoading,
    final List<GameItem>? allGAmes,
    final List<GameItem>? gamesInCart,
  }) {
    return GamesCatalogState(
        isLoading: isLoading ?? this.isLoading,
        allGAmes: allGAmes ?? this.allGAmes,
        gamesInCart: gamesInCart ?? this.gamesInCart);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GamesCatalogState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          allGAmes == other.allGAmes &&
          gamesInCart == other.gamesInCart;

  @override
  int get hashCode =>
      isLoading.hashCode ^ allGAmes.hashCode ^ gamesInCart.hashCode;

  @override
  String toString() =>
      'GamesCatalogState{isLoading: $isLoading, allGAmes: $allGAmes, gamesInCart: $gamesInCart}';
}

final loadingReducers = combineReducers<bool>([
  TypedReducer<bool, InitGamesList>(_filesLoaded),
  TypedReducer<bool, AddItemToCart>(_filesLoaded),
]);

bool _filesLoaded(bool state, action) {
  return false;
}

final allGamesReducer = combineReducers<List<GameItem>>([
  TypedReducer<List<GameItem>, LoadGamesList>(_allGamesLoaded),
]);

List<GameItem> _allGamesLoaded(List<GameItem> state, LoadGamesList action) {
  return action.gamesList;
}

final gamesInCartReducer = combineReducers<List<GameItem>>([
  TypedReducer<List<GameItem>, AddItemToCart>(_addItemToCart),
]);

List<GameItem> _addItemToCart(List<GameItem> state, AddItemToCart action) {
  return [...state, action.item];
}

GamesCatalogState appReducer(GamesCatalogState state, action) {
  return state.copyWith(
      isLoading: loadingReducers(state.isLoading, action),
      allGAmes: allGamesReducer(state.allGAmes, action),
      gamesInCart: gamesInCartReducer(state.gamesInCart, action));
}
