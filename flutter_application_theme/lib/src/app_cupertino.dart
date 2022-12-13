import 'package:flutter/cupertino.dart';
import 'package:flutter_application_theme/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProviderCupertino(),
      )
    ], child: const App());
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProviderCupertino = Provider.of<ThemeProviderCupertino>(context);

    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeProviderCupertino.current,
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
    var themeProviderCupertino = Provider.of<ThemeProviderCupertino>(context);
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        child: SafeArea(
            child: Column(children: [
          const Text('Cupertino'),
          CupertinoButton(
            child: const Text('Button'),
            onPressed: () {
              themeProviderCupertino.toggle();
            },
          )
        ])));
  }
}
