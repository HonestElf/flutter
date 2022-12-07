// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:flutter_application_state_mangement/mob_x/model/games_repository.dart';
import 'package:flutter_application_state_mangement/mob_x/model/item.dart';

part 'state.g.dart';

class GamesCatalogState = _GamesCatalogState with _$GamesCatalogState;

abstract class _GamesCatalogState with Store {
  final GamesRepository _gamesRepository;

  @observable
  bool isLoading = false;
  @observable
  List<GameItem> allGAmes = [];
  @observable
  List<GameItem> gamesInCart = [];

  @computed
  _GamesCatalogState(this._gamesRepository) {
    initGamesList();
  }

  @action
  Future<void> initGamesList() async {
    final allItems = await _gamesRepository.loadGames();
    allGAmes = allItems.map((json) => GameItem.formJson(json)).toList();
  }

  @action
  void addItemToCart(GameItem item) {
    gamesInCart = [...gamesInCart, item];
  }
}
