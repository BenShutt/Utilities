//
//  Color+RGBA.swift
//  ColorUtilities
//
//  Created by Ben Shutt on 16/07/2024.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
typealias PlatformColor = UIColor
#elseif canImport(AppKit)
import AppKit
typealias PlatformColor = NSColor
#endif

extension Color {

    /// Red, green, blue, and opacity components of a color.
    /// Components are in the range [0, 1].
    struct RGBA {

        /// Red component
        var red: Color.Component

        /// Green component
        var green: Color.Component

        /// Blue component
        var blue: Color.Component

        /// Opacity component
        var opacity: Color.Component
    }

    /// Map to a `PlatformColor` and extract the `RGBA` components
    /// - Note: There doesn't yet seem to be a SwiftUI way of extracting the RGBA components.
    var rgba: RGBA {
        let color = PlatformColor(self)

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0

        color.getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &opacity
        )

        return RGBA(
            red: .init(red),
            green: .init(green),
            blue: .init(blue),
            opacity: .init(opacity)
        )
    }
}
