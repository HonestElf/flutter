package com.example.flutter_integration_homework

import android.content.Context
import android.graphics.Color
import android.view.Gravity
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

class AndroidEditTextView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        LinearLayout(context).gravity = Gravity.CENTER
        textView = TextView(context)
        textView.textSize = 27f
        textView.gravity = Gravity.CENTER
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        print("CREATION PARAMS:$creationParams");
        if (creationParams != null) {
            textView.text = "${creationParams["text"]}"
            // print out the value of the 'text' parameter.
            println("NativeView: text = ${creationParams["text"]}")
        }
    }
}