import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyB_9UXGPuhnsaA5_-3Av2cxdSrpB0R8hXI")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
