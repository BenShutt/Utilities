// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let colorUtilities = "ColorUtilities"
let keychain = "Keychain"
let utilities = "Utilities"
let viewRenderer = "ViewRenderer"

let package = Package(
    name: "Utilities",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: colorUtilities,
            targets: [colorUtilities]
        ),
        .library(
            name: keychain,
            targets: [keychain]
        ),
        .library(
            name: utilities,
            targets: [utilities]
        ),
        .library(
            name: viewRenderer,
            targets: [viewRenderer]
        )
    ],
    targets: [
        .target(
            name: colorUtilities,
            exclude: ["README.md"]
        ),
        .target(
            name: keychain,
            exclude: ["README.md"]
        ),
        .target(
            name: utilities,
            exclude: ["README.md"]
        ),
        .target(
            name: viewRenderer,
            exclude: ["README.md"]
        ),
        .testTarget(
            name: "\(colorUtilities)Tests",
            dependencies: [.byName(name: colorUtilities)]
        ),
        .testTarget(
            name: "\(keychain)Tests",
            dependencies: [.byName(name: keychain)]
        ),
        .testTarget(
            name: "\(utilities)Tests",
            dependencies: [.byName(name: utilities)]
        )
    ]
)
