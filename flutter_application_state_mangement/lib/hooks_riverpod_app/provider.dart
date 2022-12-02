// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_application_state_mangement/hooks_riverpod_app/item.dart';

@immutable
class GamesCatalogState {
  final bool isLoading;
  final List<GameItem> gameItems;
  final List<GameItem> gamesInCart;

  const GamesCatalogState(
      {required this.isLoading,
      required this.gameItems,
      required this.gamesInCart});

  GamesCatalogState copyWith(
      {bool? isLoading,
      List<GameItem>? gameItems,
      List<GameItem>? gamesInCart}) {
    return GamesCatalogState(
      isLoading: isLoading ?? this.isLoading,
      gameItems: gameItems ?? this.gameItems,
      gamesInCart: gamesInCart ?? this.gamesInCart,
    );
  }
}

final gamesCatalogProvider =
    StateNotifierProvider<GamesCatalog, GamesCatalogState>((ref) {
  return GamesCatalog();
});

class GamesCatalog extends StateNotifier<GamesCatalogState> {
  GamesCatalog()
      : super(const GamesCatalogState(
            isLoading: false, gameItems: [], gamesInCart: []));

  void initList(List<GameItem> list) {
    state = GamesCatalogState(
        isLoading: false, gameItems: list, gamesInCart: const []);
  }

  void addItemToCart(GameItem item) {
    state = GamesCatalogState(
        isLoading: false,
        gameItems: state.gameItems,
        gamesInCart: [...state.gamesInCart, item]);
  }
}
