// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppSettingsKit",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "AppSettingsKit", targets: ["AppSettingsKit"]),
        .library(name: "RoutingHelpers",  targets: ["RoutingHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/codebendr-product-designer/Klug", from: "0.2.0"),
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.6.0"),
        .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.8.0"),
        .package(url: "https://github.com/pointfreeco/swift-identified-collections", from: "0.3.2")
    ],
    targets: [
        .target(name: "RoutingHelpers", dependencies: [
            .product(name: "Parsing", package: "swift-parsing")
        ]),
        .target(name: "AppSettingsKit",
                dependencies: [
                    "Klug",
                    "RoutingHelpers",
                    .product(name: "CasePaths", package: "swift-case-paths"),
                    .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
                    .product(name: "Parsing", package: "swift-parsing")
                ]
               )
    ]
)
