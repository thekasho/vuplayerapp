import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let messageChannel = FlutterMethodChannel(name: "main_activity_channel",
                                              binaryMessenger: controller.binaryMessenger)
    messageChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "getData" {
        let uniqueString = Bundle.main.object(forInfoDictionaryKey: "UniqueStringKey") as! String

        let data = uniqueString
        result(data)
      }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
