import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_application_2/fluro_router.dart';

class FluroNavigationApp extends StatelessWidget {
  const FluroNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigations',
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) =>
          MaterialPageRoute(builder: (BuildContext context) {
        return const NotFound();
      }),
      onGenerateRoute: FluroRouterHandler.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

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
      appBar: AppBar(),
      body: Center(
          child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Navigation',
            ),
            ElevatedButton(
                onPressed: () {
                  FluroRouterHandler.router.navigateTo(context, '/about',
                      transition: TransitionType.inFromTop);
                },
                child: const Text('About Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/about/342443');
                },
                child: const Text('About with args')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/blog');
                },
                child: const Text('Blog Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/SomePage');
                },
                child: const Text('Not found')),
          ],
        ),
      )),
    );
  }
}

class AboutPage extends StatefulWidget {
  static const routeName = '/about';
  final id;

  const AboutPage({super.key, this.id});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: widget.id != null
              ? Text('About page ${widget.id}')
              : const Text('About page')),
    );
  }
}

class BlogPage extends StatefulWidget {
  static const routeName = '/blog';
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(child: Text('Blog page')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go back'))
        ],
      ),
    );
  }
}

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Not found page')),
    );
  }
}
