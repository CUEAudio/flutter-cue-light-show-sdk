import 'dart:async';

import 'package:flutter/services.dart';

class FlutterCueLightShowSdk {
  static const MethodChannel _channel =
      const MethodChannel('flutter_cue_light_show_sdk');

  static Future<void> fetchTheme() async {
    await _channel.invokeMethod('fetchTheme');
  }

  static Future<void> launchCue() async {
    await _channel.invokeMethod('launchCue');
  }
}
