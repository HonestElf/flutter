import 'package:advanced_widgets_homework/src/theme.dart';
import 'package:advanced_widgets_homework/src/theme_widget.dart';
import 'package:advanced_widgets_homework/src/weather_widget/weather_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late AppTheme currentTheme;
  late ThemeNameEnum currentThemeName;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void switchTheme() {
    if (currentThemeName == ThemeNameEnum.light) {
      setState(() {
        currentTheme = AppTheme.darkTheme();
        currentThemeName = ThemeNameEnum.dark;
      });
    } else {
      setState(() {
        currentTheme = AppTheme.lightTheme();
        currentThemeName = ThemeNameEnum.light;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentTheme = AppTheme.lightTheme();
    currentThemeName = ThemeNameEnum.light;
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeWidget(
        theme: currentTheme,
        child: Builder(
          builder: (context) => Scaffold(
            backgroundColor: AppThemeWidget.of(context).secondaryColor,
            key: _scaffoldKey,
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                    icon: Icon(Icons.brush,
                        color: AppThemeWidget.of(context).secondaryColor))
              ],
              title: Text(
                widget.title,
                style: TextStyle(
                    color: AppThemeWidget.of(context).secondaryTextColor),
              ),
              backgroundColor: AppThemeWidget.of(context).headerColor,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WeatherWidget(),
                  Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(
                        color: AppThemeWidget.of(context).primaryTextColor),
                  ),
                  Text(
                    '$_counter',
                    style: TextStyle(
                        color: AppThemeWidget.of(context).primaryTextColor),
                  ),
                ],
              ),
            ),
            endDrawer: Drawer(
                backgroundColor: AppThemeWidget.of(context).secondaryColor,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppThemeWidget.of(context).buttonColor),
                    onPressed: () {
                      switchTheme();

                      _scaffoldKey.currentState?.closeEndDrawer();
                    },
                    child: Text('Сменить тему',
                        style: TextStyle(
                            color:
                                AppThemeWidget.of(context).secondaryTextColor)),
                  ),
                )),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              backgroundColor: AppThemeWidget.of(context).buttonColor,
              child: Icon(Icons.add,
                  color: AppThemeWidget.of(context).secondaryColor),
            ),
          ),
        ));
  }
}
