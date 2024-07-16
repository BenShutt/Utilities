# ColorUtilities

Lightweight library of [Color](https://developer.apple.com/documentation/swiftui/color) utility functions such as:

- Parsing RGBA hex strings of the form `#RRGGBBAA`
- Constructing colors from 255 RGBA components

## Examples

```swift
Color(hex: "#FF0000") // Red from hex string
Color(red255: 0, green: 0, blue: 255) // Blue from 255 RGBA components
Color(red255: 0, green: 255, blue: 0, opacity: 51) // Green from 255 RGBA components with 20% opacity
Color.random() // Random color
```
