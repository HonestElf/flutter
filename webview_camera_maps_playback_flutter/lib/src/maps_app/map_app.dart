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
  // final Completer mapControllerCompleter = Completer<YandexMapController>();

  late YandexMapController _mapController;
  static final Point _homePoint =
      Point(latitude: 55.7522200, longitude: 37.6155600);
  final animation = MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  // late double

  // Future<void> _moveToLocation(
  //   double coordDiff,
  // ) async {
  //   (await mapControllerCompleter.future).moveCamera(
  //     animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: Point(
  //           latitude: mapControllerCompleter.future.,
  //           longitude: appLatLong.long,
  //         ),
  //         zoom: 12,
  //       ),
  //     ),
  //   );
  // }

  // Future<void> _moveToCurrentLocation(
  //   AppLatLong appLatLong,
  // ) async {
  //   (await mapControllerCompleter.future).moveCamera(
  //     animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: Point(
  //           latitude: appLatLong.lat,
  //           longitude: appLatLong.long,
  //         ),
  //         zoom: 12,
  //       ),
  //     ),
  //   );
  // }

  // Future<void> _fetchCurrentLocation() async {
  //   AppLatLong location;

  //   const defLocation = MoscowLocation();

  //   try {
  //     // location = await LocationService().getCurrentLocation();
  //     location = defLocation;
  //   } catch (_) {
  //     location = defLocation;
  //   }

  //   _moveToCurrentLocation(location);
  // }

  // Future<void> _initPermission() async {
  //   if (!await LocationService().requestPermission()) {
  //     await LocationService().requestPermission();
  //   }
  //   await _fetchCurrentLocation();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _initPermission().ignore();
  // }

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
                                          currentPosition.target.longitude))));
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
                              print('LEFT');
                              final currentPosition =
                                  await _mapController.getCameraPosition();
                              _mapController.moveCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: Point(
                                          latitude:
                                              currentPosition.target.latitude -
                                                  0.01,
                                          longitude: currentPosition
                                              .target.longitude))));
                            },
                            icon: const Icon(
                              Icons.arrow_circle_left_outlined,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              print('HONE');

                              await _mapController.moveCamera(
                                  CameraUpdate.newCameraPosition(
                                      CameraPosition(target: _homePoint)));
                            },
                            icon: const Icon(
                              Icons.home,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              print('RIGHT');

                              final currentPosition =
                                  await _mapController.getCameraPosition();

                              _mapController.moveCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: Point(
                                          latitude:
                                              currentPosition.target.latitude,
                                          longitude:
                                              currentPosition.target.longitude +
                                                  0.01))));
                            },
                            icon: const Icon(
                              Icons.arrow_circle_right_outlined,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () async {
                          print('DOWN');

                          final currentPosition =
                              await _mapController.getCameraPosition();

                          _mapController.moveCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: Point(
                                      latitude: currentPosition.target.latitude,
                                      longitude:
                                          currentPosition.target.longitude -
                                              0.01))));
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
              // alignment: Alignment.bottomCenter,
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white.withOpacity(0.8)),
                      child: IconButton(
                        onPressed: () async {
                          await _mapController
                              .moveCamera(CameraUpdate.zoomIn());
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white.withOpacity(0.7)),
                      child: IconButton(
                        onPressed: () async {
                          await _mapController
                              .moveCamera(CameraUpdate.zoomOut());
                        },
                        icon: const Icon(
                          Icons.remove,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // child: Slider(
              //   value: _mapController.getCameraPosition().,
              //   onChanged: (value) {
              //     _mapController.moveCamera(CameraUpdate.zoomTo(value));
              //   },
            ),
          ],
        ),
      ],
    );
  }
}
