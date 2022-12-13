import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_theme/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MyCommonApp extends StatelessWidget {
  const MyCommonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => CommonThemeProvider(),
      )
    ], child: const App());
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var commonThemeProvider = Provider.of<CommonThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: commonThemeProvider.currentMaterialTheme,
      home: Builder(builder: (context) {
        return CupertinoApp(
            theme: commonThemeProvider.currentCupertinoTheme,
            localizationsDelegates: const [
              DefaultCupertinoLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate
            ],
            home: const MyHomePage(title: 'Common App'));
      }),
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
    var commonThemeProvider = Provider.of<CommonThemeProvider>(context);
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: SafeArea(
          child: Column(
            children: [
              Text('Cupertino Scaffold'),
              ElevatedButton(
                  onPressed: () {
                    commonThemeProvider.toggle();
                  },
                  child: const Text('Change theme'))
            ],
          ),
        ));
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text(
    //           'You have pushed the button this many times:',
    //         ),
    // ElevatedButton(
    //     onPressed: () {
    //       commonThemeProvider.toggle();
    //     },
    //     child: const Text('Change theme'))
    //       ],
    //     ),
    //   ),
    // );
  }
}
