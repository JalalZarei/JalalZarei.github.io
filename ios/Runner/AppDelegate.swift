import UIKit
import Flutter
import Contacts

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let contactChannel = FlutterMethodChannel(name: "samples.flutter.dev/contacts",
                                              binaryMessenger: controller.binaryMessenger)

    contactChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "getContacts" {
        self.getContacts(result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getContacts(result: FlutterResult) {
    let store = CNContactStore()
    let keys = [CNContactGivenNameKey as CNKeyDescriptor]
    let request = CNContactFetchRequest(keysToFetch: keys)

    var contacts = [String]()
    do {
      try store.enumerateContacts(with: request) { (contact, stop) in
        contacts.append(contact.givenName)
      }
    } catch {
      result(FlutterError(code: "UNAVAILABLE", message: "Contacts not available", details: nil))
      return
    }
    result(contacts)
  }
}
