import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(BucaGoogleIntegrityPlugin)
public class BucaGoogleIntegrityPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "BucaGoogleIntegrityPlugin"
    public let jsName = "BucaGoogleIntegrity"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = BucaGoogleIntegrity()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
}
