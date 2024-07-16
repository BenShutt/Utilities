# ViewRenderer

Small library that uses [ImageRenderer](https://developer.apple.com/documentation/swiftui/imagerenderer) to render PDF and PNG files from SwiftUI views. A common usage is generating an app icon 1024x1024 PNG image.

## PNG

```swift
let data = try PNGRenderer().pngData(content: PNGView())
try data.write(to: url, options: .atomic)
```

### Common Example

```swift
struct AppIcon: View {
    var body: some View {
         content() // Implement...
             .appIcon()
    }
    
    func write(to url: URL) throws {
        let data = try PNGRenderer().pngData(content: self)
        try data.write(to: url, options: .atomic)
    }
}
```

## PDF

```swift
try PDFRenderer().render(content: PDFView(), to: url)
```

### Common Example

```swift
struct PDFView: View {
    var body: some View {
         content() // Implement...
             .a4()
    }
    
    func write(to url: URL) throws {
        try PDFRenderer().render(content: self, to: url)
    }
}
```
