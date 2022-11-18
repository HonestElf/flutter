// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:albums_route/artists_page.dart';

enum Pages { home, artists }

List<Map<String, dynamic>> pagesList = [
  {
    'title': 'Home page',
    'pageKey': Pages.home,
    'icon': const Icon(Icons.home),
    'pageBody': const HomePageBody()
  },
  {
    'title': 'Artists page',
    'pageKey': Pages.artists,
    'icon': const Icon(Icons.music_note),
    'pageBody': const ArtistsPageBody()
  }
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Pages currentPage = Pages.home;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentPageData =
        pagesList.firstWhere((page) => page['pageKey'] == currentPage);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(currentPageData['title']),
      ),
      body: currentPageData['pageBody'],
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
                ...pagesList
                    .map((page) => ListTile(
                          title: Text(page['title']),
                          selected: currentPage == page['pageKey'],
                          selectedColor: Colors.white,
                          selectedTileColor: Colors.blue[500],
                          textColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          leading: page['icon'],
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            setState(() {
                              currentPage = page['pageKey'];
                            });

                            _scaffoldKey.currentState?.closeDrawer();
                          },
                        ))
                    .toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Routes',
          ),
        ],
      ),
    );
  }
}
