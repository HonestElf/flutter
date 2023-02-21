package com.example.webview_camera_maps_playback_flutter

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setApiKey("a4feec95-5e99-423c-b05a-527c4c823eb3") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}