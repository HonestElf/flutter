import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/cupertino_nav.dart';
import 'package:flutter_application_2/home_views.dart';
import 'package:flutter_application_2/profile_views.dart';

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cupertino nav',
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int routeIndex = 0;
  late List<GlobalKey<NavigatorState>> navigationKeys;

  List<GlobalKey<NavigatorState>> generateNavigationKeys() {
    List<GlobalKey<NavigatorState>> navKeys = navs.map((item) {
      return GlobalKey<NavigatorState>();
    }).toList();

    return navKeys;
  }

  @override
  void initState() {
    super.initState();

    navigationKeys = generateNavigationKeys();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: routeIndex,
        onTap: (int index) {
          if (routeIndex == index) {
            if (navigationKeys[index].currentState!.canPop()) {
              navigationKeys[index].currentState?.pop();
            }
            routeIndex = index;
          }
        },
        items: navs
            .map((bar) =>
                BottomNavigationBarItem(icon: Icon(bar.icon), label: bar.title))
            .toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          navigatorKey: navigationKeys[index],
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return const HomeViewPage();
              case 1:
                return const ProfileView();

              default:
                return const HomeViewPage();
            }
          },
        );
      },
    ));
  }
}
