package com.aloompa.cue_light_show.flutter_cue_light_show_sdk

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.webkit.WebView
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat.startActivity
import com.cueaudio.live.CUEActivity
import com.cueaudio.live.CUEController
import com.cueaudio.webviewsdk.WebViewController

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterCueLightShowSdkPlugin */
class FlutterCueLightShowSdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var activity: Activity
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_cue_light_show_sdk")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "fetchTheme") {
            CUEController.fetchCueTheme(activity)
        } else if (call.method == "launchCue") {
            val i = Intent(activity, CUEActivity::class.java)
            i.putExtra("arg:enable_navigation_menu", true)
            startActivity(activity, i, null)
        } else if (call.method == "launchCueV2") {
            val args: List<Any>? = call.arguments as? List<Any>
            val url = args?.firstOrNull() as? String

            if (url != null) {
                val webViewController = WebViewController(activity)
                webViewController.navigateTo(url)
                result.success("URL opened successfully")
            } else {
                result.error("URL_ERROR", "URL is null or missing", null)
            }
        } else if (call.method == "prefetchCueV2") {
            val args: List<Any>? = call.arguments as? List<Any>
            val url = args?.firstOrNull() as? String
            val preFetchUrl = url + "&preload=true"

            if (url != null) {
                val webView = WebView(context)
                webView.settings.javaScriptEnabled = true

                webView.loadUrl(preFetchUrl)
            } else {
                result.error("URL_ERROR", "URL is null or missing", null)
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onDetachedFromActivity() {
        // TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        // TODO("Not yet implemented")
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity;
    }

    override fun onDetachedFromActivityForConfigChanges() {
        // TODO("Not yet implemented")
    }
}