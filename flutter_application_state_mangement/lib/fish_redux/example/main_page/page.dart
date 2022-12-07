import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_application_state_mangement/fish_redux/example/clicker_component/component.dart';
import 'state.dart';
import 'view.dart';

class MainPage extends Page<MainState, void> {
  MainPage()
      : super(
            initState: MainState.initState,
            dependencies: Dependencies(
              slots: {
                'clicker': ClickerComponent().asDependent(ClickerConnector()),
              },
            ),
            view: mainPageView);
}
