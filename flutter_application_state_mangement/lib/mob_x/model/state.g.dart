// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GamesCatalogState on _GamesCatalogState, Store {
  late final _$isLoadingAtom =
      Atom(name: '_GamesCatalogState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$allGAmesAtom =
      Atom(name: '_GamesCatalogState.allGAmes', context: context);

  @override
  List<GameItem> get allGAmes {
    _$allGAmesAtom.reportRead();
    return super.allGAmes;
  }

  @override
  set allGAmes(List<GameItem> value) {
    _$allGAmesAtom.reportWrite(value, super.allGAmes, () {
      super.allGAmes = value;
    });
  }

  late final _$gamesInCartAtom =
      Atom(name: '_GamesCatalogState.gamesInCart', context: context);

  @override
  List<GameItem> get gamesInCart {
    _$gamesInCartAtom.reportRead();
    return super.gamesInCart;
  }

  @override
  set gamesInCart(List<GameItem> value) {
    _$gamesInCartAtom.reportWrite(value, super.gamesInCart, () {
      super.gamesInCart = value;
    });
  }

  late final _$initGamesListAsyncAction =
      AsyncAction('_GamesCatalogState.initGamesList', context: context);

  @override
  Future<void> initGamesList() {
    return _$initGamesListAsyncAction.run(() => super.initGamesList());
  }

  late final _$_GamesCatalogStateActionController =
      ActionController(name: '_GamesCatalogState', context: context);

  @override
  void addItemToCart(GameItem item) {
    final _$actionInfo = _$_GamesCatalogStateActionController.startAction(
        name: '_GamesCatalogState.addItemToCart');
    try {
      return super.addItemToCart(item);
    } finally {
      _$_GamesCatalogStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
allGAmes: ${allGAmes},
gamesInCart: ${gamesInCart}
    ''';
  }
}
