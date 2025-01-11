// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Utilities",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "ColorUtilities",
            targets: ["ColorUtilities"]
        ),
        .library(
            name: "Keychain",
            targets: ["Keychain"]
        ),
        .library(
            name: "Utilities",
            targets: ["Utilities"]
        ),
        .library(
            name: "ViewRenderer",
            targets: ["ViewRenderer"]
        )
    ],
    targets: [
        .target(name: "ColorUtilities"),
        .target(name: "Keychain"),
        .target(name: "Utilities"),
        .target(name: "ViewRenderer"),
        .testTarget(
            name: "ColorUtilitiesTests",
            dependencies: ["ColorUtilities"]
        ),
        .testTarget(
            name: "UtilitiesTests",
            dependencies: ["Utilities"]
        )
    ]
)
