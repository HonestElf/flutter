// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:albums_route/artists_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Routes',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
                child: Column(
              children: const [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300'),
                ),
                Text('Artists'),
              ],
            )),
            Column(
              children: [
                ListTile(
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  tileColor: Colors.blue[500],
                  title: const Text('Home'),
                  leading: const Icon(Icons.home),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                ),
                ListTile(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  title: const Text('Artists'),
                  leading: const Icon(Icons.music_note),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pushNamed(ArtistsPage.routeName);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
