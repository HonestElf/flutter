// Dart imports:
import 'dart:async';

// Project imports:
import 'package:flutter_application_state_mangement/bloc_app/actions/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/bloc_app/model/games_repository.dart';
import 'package:flutter_application_state_mangement/bloc_app/model/item.dart';
import 'package:flutter_application_state_mangement/bloc_app/model/state.dart';

class GamesCatalogBloc {
  final GamesRepository _gamesRepository;

  var _currentState = const GamesCatalogState();

  final _stateController = StreamController<GamesCatalogState>();
  final _actionsController = StreamController<Action>();

  Stream<GamesCatalogState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;

  GamesCatalogBloc(this._gamesRepository) {
    _actionsController.stream.listen(_handleAction);
  }

  void dispose() {
    _stateController.close();
    _actionsController.close();
  }

  void _handleAction(Action action) async {
    if (action is InitGamesList) {
      try {
        final allGames = await _gamesRepository.loadGames();
        List<GameItem> prasedGames =
            allGames.map((json) => GameItem.formJson(json)).toList();

        _currentState = _currentState.copyWith(allGAmes: prasedGames);
      } catch (error) {
        print('ERROR: $error');
      }
    } else if (action is AddItemToCart) {
      _currentState = _currentState
          .copyWith(gamesInCart: [..._currentState.gamesInCart, action.item]);
    }
    _stateController.add(_currentState);
  }
}
