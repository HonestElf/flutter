import 'package:flutter/material.dart';
import 'package:webview_camera_maps_playback_flutter/src/camera_app/app.dart';
import 'package:webview_camera_maps_playback_flutter/src/media_app/app.dart';
import 'package:webview_camera_maps_playback_flutter/src/maps_app/map_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // runApp(const CameraApp());
  // runApp(const MyMediaApp());
  runApp(const MyMapApp());
}
