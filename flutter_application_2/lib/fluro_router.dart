import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_application_2/fluro_navigation.dart';

class FluroRouterHandler {
  static FluroRouter router = FluroRouter();

  static final Handler _homeHandler = Handler(handlerFunc: (
    BuildContext? context,
    Map<String, dynamic> parameters,
  ) {
    return const HomePage();
  });

  static final Handler _aboutHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> parameters) {
    if (parameters.containsKey('uuid')) {
      return AboutPage(id: parameters['uuid'][0]);
    }
    return const AboutPage();
  });

  static final Handler _blogHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> parameters) {
    return const BlogPage();
  });

  static final Handler _notFoundRouteHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> parameters) {
    return const NotFound();
  });

  static void setupRouter() {
    router.define(HomePage.routeName, handler: _homeHandler);
    router.define(AboutPage.routeName, handler: _aboutHandler);
    router.define('${AboutPage.routeName}/:uuid',
        handler: _aboutHandler, transitionType: TransitionType.inFromRight);
    router.define(BlogPage.routeName,
        handler: _blogHandler, transitionType: TransitionType.cupertino);
    router.notFoundHandler = _notFoundRouteHandler;
  }
}
