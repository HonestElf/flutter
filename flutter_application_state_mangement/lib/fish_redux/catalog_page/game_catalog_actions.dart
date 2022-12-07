import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_application_state_mangement/fish_redux/model/item.dart';

enum Actions { initState, addItemToCart, loadGamesLst }

class ActionsCreate {
  static Action initState() => const Action(Actions.initState);
  static Action loadGamesLst(List<GameItem> gamesList) =>
      Action(Actions.loadGamesLst, payload: gamesList);
  static Action addItemToCart(GameItem value) =>
      Action(Actions.addItemToCart, payload: value);
}
