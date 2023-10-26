import Flutter
import UIKit
import WebViewSDK

public class SwiftFlutterCueLightShowSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_cue_light_show_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterCueLightShowSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "launchCue") {
        print("launching Cue SDK")
        let arguments = call.arguments as? NSArray
        let urlString: String  = arguments?[0] as! String

        let sdkController = WebViewController()
        sdkController.modalPresentationStyle = .overFullScreen
        if let url = URL(string: urlString) {
            do {
                try sdkController.navigateTo(url: url)
                let rootViewController:UIViewController! = UIApplication.shared.keyWindow?.rootViewController
                rootViewController.present(sdkController, animated: true, completion: nil)
            } catch InvalidUrlError.runtimeError(_){
                print("invalid url")
            } catch {
                print("error launching Cue SDK")
            }
            //present(sdkController, animated: true)
        }
    }
  }
}
