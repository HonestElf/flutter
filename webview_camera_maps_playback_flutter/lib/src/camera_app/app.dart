import 'package:flutter/material.dart';
import 'package:webview_camera_maps_playback_flutter/src/camera_app/camera_widget.dart';
import 'package:webview_camera_maps_playback_flutter/src/camera_app/gallery_widget.dart';
import 'package:webview_camera_maps_playback_flutter/src/camera_app/menu_item.dart';

final List<NevMenuItem> bottomNavItems = [
  const NevMenuItem(itemIcon: Icons.camera, label: 'Camera'),
  const NevMenuItem(itemIcon: Icons.photo, label: 'Gallery')
];

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [CameraWidget(), GalleryWidget()],
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (currentIndex) {
            setState(() {
              _currentPageIndex = currentIndex;
              _pageController.animateToPage(currentIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            });
          },
          items: [
            ...bottomNavItems
                .map((item) => BottomNavigationBarItem(
                    icon: Icon(item.itemIcon), label: item.label))
                .toList()
          ]),
    );
  }
}
