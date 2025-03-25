// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Screenshotdetector",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Screenshotdetector",
            targets: ["ScreenshotDetectorPluginPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "ScreenshotDetectorPluginPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/ScreenshotDetectorPluginPlugin"),
        .testTarget(
            name: "ScreenshotDetectorPluginPluginTests",
            dependencies: ["ScreenshotDetectorPluginPlugin"],
            path: "ios/Tests/ScreenshotDetectorPluginPluginTests")
    ]
)