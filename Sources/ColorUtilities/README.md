# ColorUtilities

Lightweight library with [Color](https://developer.apple.com/documentation/swiftui/color) utility methods and extensions such as:

- Parsing RGBA hex strings of the form `#RRGGBBAA`
- Constructing colors from 255 RGBA components


## Examples

```swift
Color(hex: "#FF0000") // Red from hex string
Color(red255: 0, blue: 255, green: 0) // Blue from 255 RGBA components
Color.random() // Random color
```
