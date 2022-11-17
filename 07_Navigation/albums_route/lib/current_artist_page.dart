import 'package:albums_route/fetch_file.dart';
import 'package:flutter/material.dart';

class CurrentArtistPage extends StatefulWidget {
  final String? link;
  const CurrentArtistPage({super.key, this.link});
  static const routeName = 'currentArtist';

  @override
  State<CurrentArtistPage> createState() => _CurrentArtistPageState();
}

class _CurrentArtistPageState extends State<CurrentArtistPage> {
  Map<String, dynamic>? currentArtist;

  @override
  void initState() {
    super.initState();

    if (widget.link != null) {
      loadData().then((value) {
        final foundArtist =
            value.firstWhere((element) => element['link'] == widget.link);

        if (foundArtist != null) {
          setState(() {
            currentArtist = foundArtist;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Text(currentArtist?['name'] ?? 'Atrist no found')),
            body: Center(
                child: Column(children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        child:
                            Text(currentArtist?['about'] ?? 'About not found'),
                      )))
            ]))));
  }
}
