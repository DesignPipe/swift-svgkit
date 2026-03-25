// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-svgkit",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "SVGKit", targets: ["SVGKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.0"),
        .package(url: "https://github.com/alexey1312/swift-resvg.git", exact: "0.45.1-swift.15"),
        .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "1.3.0"),
    ],
    targets: [
        .target(
            name: "SVGKit",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Resvg", package: "swift-resvg"),
            ]
        ),
        .testTarget(
            name: "SVGKitTests",
            dependencies: ["SVGKit", .product(name: "CustomDump", package: "swift-custom-dump")]
        ),
    ]
)
