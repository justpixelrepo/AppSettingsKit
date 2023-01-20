// swift-tools-version:5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppSettingsKit",
    platforms: [.iOS(.v16), .macOS(.v12)],
    products: [
        .library(name: "AppSettingsKit", targets: ["AppSettingsKit"])
    ],
    dependencies: [],
    targets: [
        .target(name: "AppSettingsKit")
    ]
)
