import 'package:flutter/material.dart';
import 'package:flutter_persistance_homework/src/hive_app/screens/category_screen.dart';
import 'package:flutter_persistance_homework/src/hive_app/screens/details_screen.dart';
import 'package:flutter_persistance_homework/src/hive_app/screens/home_screen.dart';
import 'package:flutter_persistance_homework/src/hive_app/screens/not_found_screen.dart';

class HiveApp extends StatelessWidget {
  const HiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeSreen(),
      initialRoute: '/',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const NotFoundScreen();
          },
        );
      },
      onGenerateRoute: (settings) {
        final args = settings.arguments as Map<String, dynamic>;
        switch (settings.name) {
          case CategoryScreen.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return CategoryScreen(
                  currentCategory: args['category'],
                );
              },
            );
          case DetailsScreen.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return DetailsScreen(
                  boxName: args['boxName'],
                  itemName: args['itemName'],
                );
              },
            );

          default:
            return MaterialPageRoute(
              builder: (context) {
                return const NotFoundScreen();
              },
            );
        }
      },
    );
  }
}
