//
//  Color+Random.swift
//  ColorUtilities
//
//  Created by Ben Shutt on 16/07/2024.
//

import SwiftUI

public extension Color {
    static func random() -> Color {
        Color(
            red: .random(),
            green: .random(),
            blue: .random()
        )
    }
}

// MARK: - Double + Random

private extension Double {
    static func random() -> Double {
        .random(in: 0...1)
    }
}
