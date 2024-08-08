//
//  Color+255.swift
//  ColorUtilities
//
//  Created by Ben Shutt on 16/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import SwiftUI

public extension Color {

    /// A color value in the range [0, 1]
    typealias Component = Double

    /// A color value in the range [0, 255]
    typealias Component255 = Double

    /// Shorthand for initializing with RGBA components in [0, 255]
    /// - Parameters:
    ///   - colorSpace: Color space, defaults to sRGB
    ///   - red: Red component in [0, 255]
    ///   - green: Green component in [0, 255]
    ///   - blue: Blue component in [0, 255]
    ///   - opacity: Opacity component in [0, 255], defaults to 255
    init(
        _ colorSpace: RGBColorSpace = .sRGB,
        red255 red: Component255,
        green: Component255,
        blue: Component255,
        opacity: Component255 = 255
    ) {
        self.init(
            colorSpace,
            red: red / 255,
            green: green / 255,
            blue: blue / 255,
            opacity: opacity / 255
        )
    }

    /// Shorthand for initializing with white and opacity components in [0, 255]
    /// - Parameters:
    ///   - colorSpace: Color space, defaults to sRGB
    ///   - white: White component in [0, 255]
    ///   - opacity: Opacity component in [0, 255], defaults to 255
    init(
        _ colorSpace: RGBColorSpace = .sRGB,
        white255 white: Component255,
        opacity: Component255 = 255
    ) {
        self.init(
            colorSpace,
            white: white / 255,
            opacity: opacity / 255
        )
    }
}
