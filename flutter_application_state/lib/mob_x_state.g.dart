// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_x_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExampleState on _ExampleState, Store {
  late final _$valueAtom = Atom(name: '_ExampleState.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$_ExampleStateActionController =
      ActionController(name: '_ExampleState', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_ExampleStateActionController.startAction(
        name: '_ExampleState.increment');
    try {
      return super.increment();
    } finally {
      _$_ExampleStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}