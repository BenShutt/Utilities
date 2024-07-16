//
//  Board.swift
//  ViewRenderer
//
//  Created by Ben Shutt on 16/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import SwiftUI

private struct Board: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    var backgroundColor: Color

    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .background(backgroundColor)
    }
}

// MARK: - View + Board

public extension View {
    func a4(backgroundColor: Color = .white) -> some View {
        modifier(Board(
            width: .a4Width,
            height: .a4Height,
            backgroundColor: backgroundColor
        ))
    }

    func appIcon(backgroundColor: Color = .white) -> some View {
        modifier(Board(
            width: .appIconSize,
            height: .appIconSize,
            backgroundColor: backgroundColor
        ))
    }
}

// MARK: - CGFloat + Values

private typealias Pixels = CGFloat
private typealias Points = CGFloat

private extension CGFloat {
    static let appIconSize: Pixels = 1024

    static let a4Width: Points = 595
    static let a4Height: Points = 842
}