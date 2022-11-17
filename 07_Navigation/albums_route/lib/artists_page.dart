// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:albums_route/current_artist_page.dart';
import 'package:albums_route/fetch_file.dart';
import 'package:albums_route/home_page.dart';

class ArtistsPage extends StatefulWidget {
  static const routeName = '/artists';

  const ArtistsPage({super.key});

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  List artistList = [];

  @override
  void initState() {
    super.initState();

    loadData().then((value) {
      setState(() {
        artistList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Artists Page'),
      ),
      body: Column(children: <Widget>[
        ...artistList
            .map(
              (artist) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(CurrentArtistPage.routeName,
                        arguments: {'link': artist['link']});
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: Text(artist['name']!),
                  )),
            )
            .toList()
      ]),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                  title: const Text('Home'),
                  leading: const Icon(Icons.home),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                ),
                ListTile(
                  textColor: Colors.white,
                  tileColor: Colors.blue[500],
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
    ));
  }
}
