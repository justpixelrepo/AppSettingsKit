// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppSettingsKit",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "AppSettingsKit",
            targets: ["AppSettingsKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/codebendr-product-designer/Klug", branch: "develop")
    ],
    targets: [
        .target(name: "AppSettingsKit", dependencies: ["Klug"])
    ]
)
