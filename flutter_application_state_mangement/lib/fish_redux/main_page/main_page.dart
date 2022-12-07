import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/catalog_page.dart';
import 'package:flutter_application_state_mangement/fish_redux/main_page/main_view.dart';
import 'package:flutter_application_state_mangement/fish_redux/main_page/state.dart';

class MainPage extends Page<MainState, void> {
  MainPage()
      : super(
            initState: MainState.initState,
            dependencies: Dependencies(slots: {
              'catalog': CatalogComponent().asDependent(CatalogConnector()),
            }),
            view: mainPageView);
}
