package com.example.flutter_integration_homework

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random

class MainActivity: FlutterActivity() {

    private val methodChannel = "CALL_METHOD"
    private val intentMessageId = "CALL"
    private val androidViewId= "INTEGRATION_ANDROID"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

       flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(androidViewId, AndroidEditTextViewFactory())

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            methodChannel
        ).setMethodCallHandler { call, result ->
            if (call.method == intentMessageId) {
                val text = call.arguments<String>()
                result.success(text)
                print("ANDROID TEXT:$text")
            } else {
                result.notImplemented()
            }
        }



}
}