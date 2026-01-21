import Flutter
import UIKit
import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(
            name: "screen_time",
            binaryMessenger: controller.binaryMessenger
        )

        if #available(iOS 16.0, *) {
            channel.setMethodCallHandler { call, result in
                switch call.method {

                case "requestPermission":
                    ScreenTimeManager.shared.requestPermission { granted in
                        result(granted)
                    }

                case "blockApp":
                    let args = call.arguments as! [String: Any]
                    let bundleId = args["bundleId"] as! String
                    ScreenTimeManager.shared.blockApp(bundleId: bundleId)
                    result(true)

                case "unblockAll":
                    ScreenTimeManager.shared.unblockAll()
                    result(true)

                default:
                    result(FlutterMethodNotImplemented)
                }
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

// @main
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }
