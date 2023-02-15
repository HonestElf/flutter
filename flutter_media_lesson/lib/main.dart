import 'package:flutter/material.dart';
// import 'package:flutter_media_lesson/src/camera_app/app.dart';
import 'package:flutter_media_lesson/src/media_app/app.dart';
import 'package:flutter_media_lesson/src/example.dart';
import 'package:flutter_media_lesson/src/inapp_webview/app.dart';
import 'package:flutter_media_lesson/src/webview_app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const MyCameraApp());
  // runApp(const MyMediaApp());
  // runApp(const VideoApp());
  // runApp(const MyInAppWebview());
  runApp(const MyWebViewApp());
}
