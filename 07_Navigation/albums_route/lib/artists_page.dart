// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:albums_route/current_artist_page.dart';
import 'package:albums_route/fetch_file.dart';

class ArtistsPageBody extends StatefulWidget {
  const ArtistsPageBody({super.key});

  @override
  State<ArtistsPageBody> createState() => _ArtistsPageBodyState();
}

class _ArtistsPageBodyState extends State<ArtistsPageBody> {
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
    ));
  }
}
