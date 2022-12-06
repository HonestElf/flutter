import 'dart:async';

import 'package:flutter_application_state_mangement/cubit_app/model/games_repository.dart';
import 'package:flutter_application_state_mangement/cubit_app/model/item.dart';
import 'package:flutter_application_state_mangement/cubit_app/model/state.dart';

class GamesCatalogBloc {
  final GamesRepository _gamesRepository;

  var _currentState = const GamesCatalogState();

  final _stateController = StreamController<GamesCatalogState>();

  Stream<GamesCatalogState> get state => _stateController.stream;

  GamesCatalogBloc(this._gamesRepository);

  void dispose() {
    _stateController.close();
  }

  void initGamesList() async {
    final allGames = await _gamesRepository.loadGames();
    List<GameItem> prasedGames =
        allGames.map((json) => GameItem.formJson(json)).toList();

    _currentState = _currentState.copyWith(allGAmes: prasedGames);

    _stateController.add(_currentState);
  }

  void addItemToCart(item) {
    _currentState = _currentState
        .copyWith(gamesInCart: [..._currentState.gamesInCart, item]);

    _stateController.add(_currentState);
  }
}
