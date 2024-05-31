import UIKit
import Flutter
import GoogleMaps
import FirebaseCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if FirebaseApp.app() == nil {
        FirebaseApp.configure()
    }

   if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }

    //TODO IOS MAP API KEY HERE
    GMSServices.provideAPIKey("MAP_API_KEY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}