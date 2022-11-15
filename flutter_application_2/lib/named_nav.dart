import 'package:flutter/material.dart';

class NamedRoutesApp extends StatelessWidget {
  const NamedRoutesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigations',
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) =>
          MaterialPageRoute(builder: (BuildContext context) {
        return const NotFound();
      }),
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/about': (BuildContext context) => const AboutPage(),
        '/blog': (BuildContext context) => const BlogPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
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
                  Navigator.of(context).pushNamed('/about');
                },
                child: const Text('About Page')),
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
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('About page')),
    );
  }
}

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
