import Flutter
import UIKit
import CUELive

public class SwiftFlutterCueLightShowSdkPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_cue_light_show_sdk", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterCueLightShowSdkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "launchCue") {
            print("launching Cue SDK")
            
            let initialController = NavigationManager.initialController()
            initialController.modalPresentationStyle = .overFullScreen
            let rootViewController:UIViewController! = UIApplication.shared.keyWindow?.rootViewController
            rootViewController.present(initialController, animated: true, completion: nil)
        } else if (call.method == "fetchTheme") {
            print("fetching CUE Theme")
            CUEMultiDownloader.fetchCUETheme()
        }
    }
}

