import 'package:flutter_application_state_mangement/mob_x/actions/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/mob_x/model/games_repository.dart';
import 'package:flutter_application_state_mangement/mob_x/model/item.dart';
import 'package:flutter_application_state_mangement/mob_x/model/state.dart';
import 'package:redux/redux.dart';

List<Middleware<GamesCatalogState>> createStoreMiddleware([
  GamesRepository speakersRepo = const ConstGamesRepository(),
]) {
  final loadGames = _createLoadGames(speakersRepo);

  return [
    TypedMiddleware<GamesCatalogState, InitGamesList>(loadGames),
  ];
}

Middleware<GamesCatalogState> _createLoadGames(GamesRepository repository) {
  return (Store<GamesCatalogState> store, action, NextDispatcher next) {
    repository.loadGames().then((allGames) {
      List<GameItem> prasedGames =
          allGames.map((json) => GameItem.formJson(json)).toList();

      store.dispatch(
        LoadGamesList(
          prasedGames,
        ),
      );
    }).catchError((_) => print('ERROR IN MIDDLEWARE'));

    next(action);
  };
}
