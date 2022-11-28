import 'package:flutter/material.dart';
import 'package:flutter_application_animation/spaces.dart';

class MySpaceApp extends StatelessWidget {
  const MySpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            ...spacesList
                .map((space) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return DetailedView(data: space);
                          },
                        ));
                      },
                      child: Column(children: [
                        Hero(
                            tag: space.id,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(space.image),
                            )),
                        Hero(
                            tag: '${space.id}-title',
                            child: Material(
                                child: Text(
                              space.description,
                              maxLines: 2,
                            ))),
                        Hero(
                            tag: '${space.id}-button',
                            child: Material(
                                child: Container(
                              padding: const EdgeInsets.all(5),
                              color: Colors.red,
                              child: const Icon(Icons.arrow_forward),
                            )))
                      ]),
                    ))
                .toList()
          ],
        ));
  }
}

class DetailedView extends StatelessWidget {
  const DetailedView({super.key, required this.data});
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(tag: data.id, child: Image.asset(data.image)),
                Positioned(
                    bottom: -20,
                    right: 20,
                    child: Hero(
                        tag: '${data.id}-button',
                        child: Material(
                            child: Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.blue[200],
                          child: const Icon(Icons.arrow_forward),
                        )))),
              ],
            ),
          ),
          Hero(
              tag: '${data.id}-title',
              child: Material(
                child: Text(data.description),
              )),
        ],
      )),
    );
  }
}
