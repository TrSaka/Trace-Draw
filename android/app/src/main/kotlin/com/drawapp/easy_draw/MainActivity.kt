package com.drawapp.easy_draw

import android.content.Context
import android.net.ConnectivityManager
import android.net.wifi.WifiManager
import android.os.Bundle
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.Manifest
import android.content.pm.PackageManager


class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.drawapp.easy_draw.ip_address"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        if(ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_WIFI_STATE)==PackageManager.PERMISSION_GRANTED){
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getIpAddress") {
                val ipAddress = getIpAddress()
                result.success(ipAddress)
            } else {
                result.notImplemented()
            }
        }
        }
    }

    private fun getIpAddress(): String {
        val connectivityManager = applicationContext.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val networkInfo = connectivityManager.activeNetworkInfo
        var ipAddress = ""

        if (networkInfo != null && networkInfo.isConnected) {
            val wifiManager = applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager
            val wifiInfo = wifiManager.connectionInfo
            ipAddress = intToIp(wifiInfo.ipAddress)
        }

        return ipAddress
    }

    private fun intToIp(ip: Int): String {
        return (ip and 0xFF).toString() + "." +
                (ip shr 8 and 0xFF) + "." +
                (ip shr 16 and 0xFF) + "." +
                (ip shr 24 and 0xFF)
    }
}
