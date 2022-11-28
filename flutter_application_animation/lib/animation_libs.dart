import 'package:flutter/material.dart';
import 'package:flutter_application_animation/spaces.dart';
import 'package:animations/animations.dart';

class AnimationLibs extends StatelessWidget {
  const AnimationLibs({super.key});

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
              .map(
                (item) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: OpenContainer(
                        closedBuilder: (context, action) => Column(
                              children: [
                                Image.asset(item.image),
                                Text(
                                  item.description,
                                  maxLines: 2,
                                )
                              ],
                            ),
                        openBuilder: (context, action) =>
                            DetailedView(data: item))),
              )
              .toList()
        ],
      ),
    );
  }
}

class DetailedView extends StatelessWidget {
  const DetailedView({super.key, required this.data});
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [Image.asset(data.image), Text(data.description)]),
    );
  }
}
