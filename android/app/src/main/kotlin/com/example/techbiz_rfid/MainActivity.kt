package com.example.techbiz_rfid

import android.os.Bundle
import android.content.BroadcastReceiver
import android.content.Intent
import android.content.IntentFilter
import android.content.Context
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import android.view.KeyEvent
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.techbusiness.hardware_button"
    private val keyReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            intent?.let {
                var keyCode = it.getIntExtra("keyCode", 0)
                if (keyCode == 0) {
                    keyCode = it.getIntExtra("keycode", 0)
                }

                val keyDown = it.getBooleanExtra("keyDown", false)
                Log.d("KeyReceiver", "Received keyCode: $keyCode, keyDown: $keyDown")
                MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("onScanKeyPressed", keyCode)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val filter = IntentFilter("com.rfid")
        registerReceiver(keyReceiver, filter)
    }

    override fun onDestroy() {
        super.onDestroy()
        unregisterReceiver(keyReceiver)
    }
}
