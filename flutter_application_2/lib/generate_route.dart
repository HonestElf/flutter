import 'package:flutter/material.dart';

class GeneratedRoutesApp extends StatelessWidget {
  const GeneratedRoutesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigations',
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) =>
          MaterialPageRoute(builder: (BuildContext context) {
        return const NotFound();
      }),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const HomePage();
            });

          case AboutPage.routeName:
            if (settings.arguments != null) {
              if (settings.arguments != null) {
                final args = settings.arguments as Map<String, dynamic>;
                if (args.containsKey('id')) {
                  return MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return AboutPage(id: args['id']);
                      });
                }
              }
            }

            return MaterialPageRoute(builder: (BuildContext context) {
              return const AboutPage();
            });

          case BlogPage.routeName:
            return PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation seconaryAnimation) {
              return const BlogPage();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation seconaryAnimation,
                child) {
              CurvedAnimation _curved = CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn);

              Animation<double> _animate =
                  Tween<double>(begin: 0.0, end: 1.0).animate(_curved);

              return ScaleTransition(
                  scale: _animate,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ));
            });

          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const NotFound();
            });
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
                  Navigator.of(context).pushNamed('/about');
                },
                child: const Text('About Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/about', arguments: {'id': 342443});
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
  final int? id;

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
