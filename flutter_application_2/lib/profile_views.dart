import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.orange,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Profile View'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (BuildContext context) {
                  return const ProfileViewDetail();
                }));
              },
              child: const Text('Go to detail page'))
        ],
      )),
    );
  }
}

class ProfileViewDetail extends StatefulWidget {
  const ProfileViewDetail({super.key});

  @override
  State<ProfileViewDetail> createState() => _ProfileViewDetailState();
}

class _ProfileViewDetailState extends State<ProfileViewDetail> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.blue,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Profile View Detail'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (BuildContext context) {
                  return const ProfileViewNested();
                }));
              },
              child: const Text('Go to nestetd page'))
        ],
      )),
    );
  }
}

class ProfileViewNested extends StatefulWidget {
  const ProfileViewNested({super.key});

  @override
  State<ProfileViewNested> createState() => _ProfileViewNestedState();
}

class _ProfileViewNestedState extends State<ProfileViewNested> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.red,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text('Profile View Nested'),
        ],
      )),
    );
  }
}
