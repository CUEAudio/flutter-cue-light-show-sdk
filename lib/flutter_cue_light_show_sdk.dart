import 'dart:async';

import 'package:flutter/services.dart';

abstract class FlutterCueLightShowSdk {
  const FlutterCueLightShowSdk._();

  static const MethodChannel _channel =
      MethodChannel('flutter_cue_light_show_sdk');

  static Future<void> launchCueV2(String urlString) async {
    await _channel.invokeMethod('launchCueV2', <dynamic>[urlString]);
  }

  static Future<void> fetchTheme() async {
    await _channel.invokeMethod('fetchTheme');
  }

  static Future<void> launchCue() async {
    await _channel.invokeMethod('launchCue');
  }
}
