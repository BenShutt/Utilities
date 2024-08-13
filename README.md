# Utilities

A package of common functionality used in Swift development.

## Libraries

There are 3 targets, each create a corresponding library product and has its own `README.md`:

- ColorUtilities
- Utilities
- ViewRenderer

## Installation (SwiftPM)

Add a dependency to your `Package.swift` file or the package list in Xcode:

```swift
dependencies: [
    .package(
        url: "https://github.com/BenShutt/Utilities.git",
        branch: "develop"
    )
]
```

In your target, add the required product dependencies:

```swift
dependencies: [
    .product(name: "ColorUtilities", package: "Utilities"),
    .product(name: "Utilities", package: "Utilities"),
    .product(name: "ViewRenderer", package: "Utilities")
]
```
