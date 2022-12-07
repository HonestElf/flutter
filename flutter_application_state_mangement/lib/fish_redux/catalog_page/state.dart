import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_application_state_mangement/fish_redux/model/item.dart';

class GamesCatalogState implements Cloneable<GamesCatalogState> {
  bool isLoading = false;
  List<GameItem> allGAmes = [];
  List<GameItem> gamesInCart = [];

  @override
  GamesCatalogState clone() {
    return GamesCatalogState()
      ..isLoading = isLoading
      ..allGAmes = allGAmes
      ..gamesInCart = gamesInCart;
  }
}
