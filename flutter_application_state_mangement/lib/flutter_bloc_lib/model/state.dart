import 'package:flutter_application_state_mangement/flutter_bloc_lib/model/item.dart';

class GamesCatalogState {
  final bool isLoading;
  final List<GameItem> allGAmes;
  final List<GameItem> gamesInCart;

  const GamesCatalogState(
      {this.isLoading = false,
      this.allGAmes = const [],
      this.gamesInCart = const []});

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
