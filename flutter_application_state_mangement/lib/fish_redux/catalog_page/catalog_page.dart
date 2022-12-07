import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'catalog_view.dart';

class CatalogComponent extends Component<GamesCatalogState> {
  CatalogComponent()
      : super(
            effect: initEffect(),
            reducer: catalogReducer,
            view: catalogPageView);
}
