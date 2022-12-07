import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/game_catalog_actions.dart';
import 'package:flutter_application_state_mangement/fish_redux/model/games_repository.dart';
import 'package:flutter_application_state_mangement/fish_redux/model/item.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/state.dart';

Effect<GamesCatalogState> initEffect() {
  return combineEffects({
    Actions.initState: initGamesCatalog,
  });
}

Future<void> initGamesCatalog(
    Action action, Context<GamesCatalogState> context) async {
  GamesRepository _gamesRepository = const ConstGamesRepository();

  try {
    final allGames = await _gamesRepository.loadGames();
    List<GameItem> prasedGames =
        allGames.map((json) => GameItem.formJson(json)).toList();
    context.dispatch(ActionsCreate.loadGamesLst(prasedGames));
  } catch (error) {
    print('ERROR: $error');
  }
}
