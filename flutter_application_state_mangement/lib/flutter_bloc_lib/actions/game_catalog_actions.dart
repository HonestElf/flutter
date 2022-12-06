import 'package:flutter_application_state_mangement/flutter_bloc_lib/model/item.dart';

abstract class Action {}

class InitGamesList extends Action {}

class AddItemToCart extends Action {
  final GameItem item;

  AddItemToCart(this.item);
}
