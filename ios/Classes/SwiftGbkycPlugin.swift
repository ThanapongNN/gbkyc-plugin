import Flutter
import UIKit

public class SwiftGbkycPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "gbkyc", binaryMessenger: registrar.messenger())
    let instance = SwiftGbkycPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getLivenessFacetec") {
      // guard let args = call.arguments else {
      //     return
      // }
      // if let myArgs = args as? [String: Any],
      //     let local = myArgs["local"] as? String {
      //     FaceTec.sdk.setLanguage(local)
      // }
      // controller.addChild(facetec)
      // facetec.onLivenessCheckPressed(self)
      result("Call Liveness")
    } else if (call.method == "getResultFacetec") {
      result(false)
      // result(facetec.latestProcessor.isSuccess())
    } else if (call.method == "getImageFacetec") {
      result("getImageFacetec")
      // result(facetec.latestSessionResult.auditTrailCompressedBase64![0])
    } else {
      result("FlutterMethodNotImplemented")
      // result(FlutterMethodNotImplemented)
    }
  }
}
