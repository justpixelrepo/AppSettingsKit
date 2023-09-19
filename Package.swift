// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppSettingsKit",
    platforms: [.iOS(.v17), .macOS(.v12)],
    products: [
        .library(name: "AppSettingsKit", targets: ["AppSettingsKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swiftui-navigation", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "AppSettingsKit",
            dependencies: [
                  .product(name: "SwiftUINavigation", package: "swiftui-navigation")
                ])
    ]
)
