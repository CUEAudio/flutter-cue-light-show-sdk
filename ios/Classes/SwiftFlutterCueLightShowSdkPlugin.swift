import Flutter
import UIKit
import WebViewSDK
import CUELive

public class SwiftFlutterCueLightShowSdkPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_cue_light_show_sdk", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterCueLightShowSdkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "launchCueV2") {
            print("launching Cue SDK V2")
            let arguments = call.arguments as? NSArray
            let urlString: String  = arguments?[0] as! String
            
            let sdkController = WebViewController()
            sdkController.modalPresentationStyle = .fullScreen
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
            }
        } else if (call.method == "prefetchCueV2") {
            print("prefetching CUE V2 SDK assets")
            let arguments = call.arguments as? NSArray
            let urlString: String  = arguments?[0] as! String

            let sdkController = WebViewController()
            if let url = URL(string: "\(urlString)&preload=true") {
                do {
                    try sdkController.navigateTo(url: url) {progress in
                        // You can get progress from 0 to 100 during the pre-fetch process
                        print("CUE prefetch progress: \(progress)")
                    }
                } catch InvalidUrlError.runtimeError(let message) {
                    print("CUE prefetch URL is not valid: \(message)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }  else if (call.method == "launchCue") {
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

