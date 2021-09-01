import Flutter
import UIKit

public class SwiftFlutterCueLightShowSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_cue_light_show_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterCueLightShowSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "launchCue") {

    } else if (call.method == "fetchTheme") {
    }
  }
}
