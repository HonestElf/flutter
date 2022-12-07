import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/state.dart';

class MainState implements Cloneable<MainState> {
  late GamesCatalogState gamesCatalogState;

  @override
  MainState clone() {
    return MainState()..gamesCatalogState = gamesCatalogState;
  }

  static MainState initState(dynamic params) {
    return MainState()..gamesCatalogState = GamesCatalogState();
  }
}

class CatalogConnector extends ConnOp<MainState, GamesCatalogState> {
  @override
  GamesCatalogState get(MainState state) => state.gamesCatalogState;

  @override
  void set(MainState state, GamesCatalogState subState) =>
      state.gamesCatalogState = subState;
}
