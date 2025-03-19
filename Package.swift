// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BucaGoogleIntegrity",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "BucaGoogleIntegrity",
            targets: ["BucaGoogleIntegrityPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "BucaGoogleIntegrityPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/BucaGoogleIntegrityPlugin"),
        .testTarget(
            name: "BucaGoogleIntegrityPluginTests",
            dependencies: ["BucaGoogleIntegrityPlugin"],
            path: "ios/Tests/BucaGoogleIntegrityPluginTests")
    ]
)