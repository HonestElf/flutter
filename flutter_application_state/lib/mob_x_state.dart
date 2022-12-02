import 'package:mobx/mobx.dart';

part 'mob_x_state.g.dart';

class ExampleState = _ExampleState with _$ExampleState;

abstract class _ExampleState with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
