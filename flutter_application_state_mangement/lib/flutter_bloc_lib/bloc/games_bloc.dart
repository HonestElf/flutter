// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:flutter_application_state_mangement/flutter_bloc_lib/actions/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/flutter_bloc_lib/model/games_repository.dart';
import 'package:flutter_application_state_mangement/flutter_bloc_lib/model/item.dart';
import 'package:flutter_application_state_mangement/flutter_bloc_lib/model/state.dart';

class GamesCatalogBloc extends Bloc<Action, GamesCatalogState> {
  final GamesRepository _gamesRepository;

  var _currentState = const GamesCatalogState();

  GamesCatalogBloc(this._gamesRepository) : super(const GamesCatalogState()) {
    on<InitGamesList>((event, emit) async {
      final allGames = await _gamesRepository.loadGames();
      List<GameItem> prasedGames =
          allGames.map((json) => GameItem.formJson(json)).toList();

      _currentState = _currentState.copyWith(allGAmes: prasedGames);
      emit(_currentState);
    });

    on<AddItemToCart>(
      (event, emit) {
        _currentState = _currentState
            .copyWith(gamesInCart: [..._currentState.gamesInCart, event.item]);
        emit(_currentState);
      },
    );
  }
}
