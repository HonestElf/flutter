import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MyMapApp extends StatelessWidget {
  const MyMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const MapScreen());
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late YandexMapController _mapController;
  static final Point _homePoint =
      Point(latitude: 55.7522200, longitude: 37.6155600);
  final animation = MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  double _currentZoom = 1;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        YandexMap(
          onMapCreated: ((YandexMapController yandexMapController) async {
            _mapController = yandexMapController;
          }),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          print('UP');
                          final currentPosition =
                              await _mapController.getCameraPosition();

                          _mapController.moveCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: Point(
                                      latitude:
                                          currentPosition.target.latitude +
                                              0.01,
                                      longitude:
                                          currentPosition.target.longitude),
                                  zoom: _currentZoom)));
                        },
                        icon: const Icon(
                          Icons.arrow_circle_up_outlined,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () async {
                              final currentPosition =
                                  await _mapController.getCameraPosition();
                              _mapController.moveCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                target: Point(
                                    latitude: currentPosition.target.latitude,
                                    longitude:
                                        currentPosition.target.longitude -
                                            0.01),
                                zoom: _currentZoom,
                              )));
                            },
                            icon: const Icon(
                              Icons.arrow_circle_left_outlined,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await _mapController.moveCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                target: _homePoint,
                                zoom: _currentZoom,
                              )));
                            },
                            icon: const Icon(
                              Icons.home,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              final currentPosition =
                                  await _mapController.getCameraPosition();

                              _mapController.moveCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: Point(
                                          latitude:
                                              currentPosition.target.latitude,
                                          longitude:
                                              currentPosition.target.longitude +
                                                  0.01),
                                      zoom: _currentZoom)));
                            },
                            icon: const Icon(
                              Icons.arrow_circle_right_outlined,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () async {
                          final currentPosition =
                              await _mapController.getCameraPosition();

                          _mapController.moveCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: Point(
                                      latitude:
                                          currentPosition.target.latitude -
                                              0.01,
                                      longitude:
                                          currentPosition.target.longitude),
                                  zoom: _currentZoom)));
                        },
                        icon: const Icon(
                          Icons.arrow_circle_down_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Slider(
                min: 1,
                max: 20,
                value: _currentZoom,
                onChanged: (value) {
                  _mapController.moveCamera(CameraUpdate.zoomTo(value));
                  setState(() {
                    _currentZoom = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
