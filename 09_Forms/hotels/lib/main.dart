// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:hotels/views/home_view.dart';
import 'package:hotels/views/hotel_details_view.dart';
import 'package:hotels/views/not_found_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const NotFoundPage();
        });
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeView.routeName:
            return MaterialPageRoute(builder: (context) {
              return const HomeView();
            });

          case HotelDetailsView.routeName:
            final args = settings.arguments as Map<String, dynamic>;

            if (args.containsKey('uuid')) {
              return MaterialPageRoute(builder: (context) {
                return HotelDetailsView(uuid: args['uuid']);
              });
            }

            return MaterialPageRoute(builder: (context) {
              return const NotFoundPage();
            });

          default:
            return MaterialPageRoute(builder: (context) {
              return const NotFoundPage();
            });
        }
      },
    );
  }
}
