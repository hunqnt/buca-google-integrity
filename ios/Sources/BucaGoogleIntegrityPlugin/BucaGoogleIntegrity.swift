import Foundation

@objc public class BucaGoogleIntegrity: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
