import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_state_mangement/fish_redux/catalog_page/state.dart';

Widget mainPageView(
    GamesCatalogState state, Dispatch dispatch, ViewService viewService) {
  final catalogWidget = viewService.buildComponent('catalog');
  return Container(
    child: catalogWidget,
  );
}
