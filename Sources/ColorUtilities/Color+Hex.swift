//
//  Color+Hex.swift
//  ColorUtilities
//
//  Created by Ben Shutt on 16/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import SwiftUI

public extension Color {

    /// RGBA hex of the form `"#RRGGBBAA"`
    typealias RGBAHex = String

    /// Initialize with the given hex color string.
    ///
    /// The argument of one of the following forms:
    /// - RGB (12-bit)
    /// - RGB (24-bit)
    /// - RGBA (32-bit)
    ///
    /// - Parameter string: Formatted hex string representing a color
    init?(hex string: RGBAHex) {
        // Trim non-alphanumerics (which includes the optional # character)
        let hex = string.trimmingCharacters(in: .hexadecimal.inverted)

        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = (
                (int >> 8) * 17, // r
                (int >> 4 & 0xF) * 17, // g
                (int & 0xF) * 17, // b
                255 // a
            )
        case 6: // RGB (24-bit)
            (r, g, b, a) = (
                int >> 16, // r
                int >> 8 & 0xFF, // g
                int & 0xFF, // b
                255 // a
            )
        case 8: // RGBA (32-bit)
            (r, g, b, a) = (
                int >> 24, // r
                int >> 16 & 0xFF, // g
                int >> 8 & 0xFF, // b
                int & 0xFF // a
            )
        default:
            return nil
        }

        self.init(
            red255: .init(r),
            green: .init(g),
            blue: .init(b),
            opacity: .init(a)
        )
    }

    /// Format as an RGBA hex color string
    /// - Parameter opacity: Include the opacity component
    func hex(opacity: Bool = true) -> String {
        let rgba = self.rgba

        var hex = String(
            format: "#%02X%02X%02X",
            rgba.red.int255,
            rgba.green.int255,
            rgba.blue.int255
        )

        if opacity {
            hex += String(format: "%02X", rgba.opacity.int255)
        }

        return hex
    }
}

// MARK: - Color.Component + Color

private extension Color.Component {
    var int255: Int {
        Int((self * 255).rounded())
    }
}

// MARK: - CharacterSet + Color

private extension CharacterSet {
    static var hexadecimal: CharacterSet {
        CharacterSet(charactersIn: "0123456789abcdefABCDEF")
    }
}
