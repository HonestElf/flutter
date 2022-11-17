// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:albums_route/current_artist_page.dart';
import 'package:albums_route/home_page.dart';
import 'package:albums_route/not_found_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return const NotFoundPage();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case CurrentArtistPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;

            return MaterialPageRoute(builder: (BuildContext context) {
              if (args.containsKey('link')) {
                return CurrentArtistPage(link: args['link']);
              }
              return const CurrentArtistPage();
            });

          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const NotFoundPage();
            });
        }
      },
    );
  }
}
