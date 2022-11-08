// Flutter imports:
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class TabItem {
  String title;
  Icon icon;
  TabItem(this.title, this.icon);
}

final List<TabItem> _tabBar = [
  TabItem('Photo', const Icon(Icons.home)),
  TabItem('Chat', const Icon(Icons.chat)),
  TabItem('Albums', const Icon(Icons.album)),
];

final List<TabItem> _drawerTabs = [
  TabItem('Profile', const Icon(Icons.person)),
  TabItem('Images', const Icon(Icons.image)),
  TabItem('Files', const Icon(Icons.file_copy)),
];

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TabController _tabController;
  int _currentTabIndex = 0;
  bool _isButtonVisible = true;

  PersistentBottomSheetController _controller;

  void toggleBottomSheet() {
    setState(() {
      _isButtonVisible = !_isButtonVisible;
    });
    if (_controller == null) {
      _controller =
          scaffoldKey.currentState.showBottomSheet((context) => Container(
                color: Colors.blueGrey[100],
                height: 110,
                child: Center(
                    child: Column(
                  children: [
                    const ListTile(
                      title: Text('Profile'),
                      leading: Icon(Icons.credit_card),
                      trailing: Text('200 руб'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey[850],
                        backgroundColor: Colors.blueGrey[100],
                      ),
                      onPressed: () {},
                      child: const Text('Оплатить'),
                    )
                  ],
                )),
              ));
    } else {
      _controller.close();
      _controller = null;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('App bar title'),
        actions: [
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.person))),
        ],
      ),
      drawer: Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          DrawerHeader(
              child: Column(
            children: const [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
              ),
              Text('Profile name')
            ],
          )),
          Column(
            children: [
              for (final item in _drawerTabs)
                ListTile(
                  title: Text(item.title),
                  leading: item.icon,
                  trailing: const Icon(Icons.arrow_forward),
                )
            ],
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.grey[850],
                    backgroundColor: Colors.blueGrey[100],
                  ),
                  onPressed: () {},
                  child: const Text('Выход'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.grey[850],
                    backgroundColor: Colors.blueGrey[100],
                  ),
                  onPressed: () {},
                  child: const Text('Регистрация'),
                )
              ],
            ),
          ))
        ]),
      ),
      endDrawer: Drawer(
          child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: const [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage('https://picsum.photos/200/300'),
          ),
          Text('Username')
        ]),
      )),
      body: GestureDetector(
        onTap: () => {
          if (_controller != null) {toggleBottomSheet()}
        },
        child: TabBarView(
            controller: _tabController,
            children: const [Text(''), Text(''), Text('')]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          })
        },
        currentIndex: _currentTabIndex,
        items: [
          for (final item in _tabBar)
            BottomNavigationBarItem(label: item.title, icon: item.icon)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Visibility(
          visible: _isButtonVisible,
          child: FloatingActionButton(
            onPressed: toggleBottomSheet,
            child: const Icon(Icons.add),
          )),
    );
  }
}
