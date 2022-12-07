// Project imports:
import 'package:flutter_application_state_mangement/mob_x/model/item.dart';

abstract class Action {}

class InitGamesList extends Action {}

class LoadGamesList extends Action {
  final List<GameItem> gamesList;

  LoadGamesList(this.gamesList);
}

class AddItemToCart extends Action {
  final GameItem item;

  AddItemToCart(this.item);
}
