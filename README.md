# Utilities

A swift package of common functionality used in Swift development.

## Libraries

There are 3 targets, each of which create a corresponding library product with its own `README.md`:

- ColorUtilities
- Utilities
- ViewRenderer

## Installation (SPM)

Add as a dependency to your `Package.swift` file or the package list in Xcode.

```swift
dependencies: [
    .package(
        url: "https://github.com/BenShutt/Utilities.git",
        branch: "develop"
    )
]
```

In your target, add the relevant product dependencies

```swift
dependencies: [
    .product(name: "ColorUtilities", package: "Utilities"),
    .product(name: "Utilities", package: "Utilities"),
    .product(name: "ViewRenderer", package: "Utilities")
]
```