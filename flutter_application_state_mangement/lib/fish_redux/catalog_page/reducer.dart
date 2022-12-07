import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/state.dart';

GamesCatalogState catalogReducer(GamesCatalogState state, Action action) {
  if (action.type == Actions.initState) {
    return state.clone()..allGAmes = action.payload;
  } else if (action.type == Actions.addItemToCart) {
    return state.clone()..gamesInCart = [...state.gamesInCart + action.payload];
  } else if (action.type == Actions.loadGamesLst) {
    return state.clone()..allGAmes = action.payload;
  }
  return state;
}
