import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.green,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Home View'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (BuildContext context) {
                  return const HomeViewDetail();
                }));
              },
              child: const Text('Go to detail page'))
        ],
      )),
    );
  }
}

class HomeViewDetail extends StatefulWidget {
  const HomeViewDetail({super.key});

  @override
  State<HomeViewDetail> createState() => _HomeViewDetailState();
}

class _HomeViewDetailState extends State<HomeViewDetail> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.purple,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Home View Detail'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (BuildContext context) {
                  return const HomeViewNested();
                }));
              },
              child: const Text('Go to nestetd page'))
        ],
      )),
    );
  }
}

class HomeViewNested extends StatefulWidget {
  const HomeViewNested({super.key});

  @override
  State<HomeViewNested> createState() => _HomeViewNestedState();
}

class _HomeViewNestedState extends State<HomeViewNested> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.cyan,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text('Home View Nested'),
        ],
      )),
    );
  }
}
