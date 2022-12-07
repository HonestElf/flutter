// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_application_state_mangement/fish_redux/main_page/main_page.dart';

class FishReduxApp extends StatefulWidget {
  @override
  _FishReduxAppState createState() => _FishReduxAppState();
}

class _FishReduxAppState extends State<FishReduxApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage().buildPage(null));
  }
}
