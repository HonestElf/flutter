import 'package:flutter/material.dart';
import 'package:flutter_application_animation/spaces.dart';
import 'package:animations/animations.dart';

class LibAxis extends StatelessWidget {
  const LibAxis({super.key});

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
              .map((item) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 1200),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            // transitionType: SharedAxisTransitionType.scaled,
                            transitionType: SharedAxisTransitionType.horizontal,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return DetailedView(
                            data: item,
                          );
                        },
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        child: Column(children: [
                          Image.asset(item.image),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              item.description,
                              maxLines: 2,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ))
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
