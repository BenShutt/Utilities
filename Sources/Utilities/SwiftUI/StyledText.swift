//
//  StyledText.swift
//  Utilities
//
//  Created by Ben Shutt on 16/07/2024.
//

import SwiftUI

private struct StyledText: ViewModifier {
    var font: Font
    var truncationMode: Text.TruncationMode
    var lineLimit: Int?
    var textAlignment: TextAlignment
    var foregroundColor: Color
    var maxWidth: CGFloat?

    private var alignment: Alignment {
        switch textAlignment {
        case .leading: .leading
        case .center: .center
        case .trailing: .trailing
        }
    }

    func body(content: Content) -> some View {
        content
            .font(font)
            .truncationMode(truncationMode)
            .lineLimit(lineLimit)
            .multilineTextAlignment(textAlignment)
            .foregroundStyle(foregroundColor)
            .frame(maxWidth: maxWidth, alignment: alignment)
    }
}

// MARK: - View + TextStyle

public extension View {
    func styledText(
        font: Font,
        truncationMode: Text.TruncationMode = .tail,
        lineLimit: Int? = nil,
        textAlignment: TextAlignment = .center,
        foregroundColor: Color = .black,
        maxWidth: CGFloat? = nil
    ) -> some View {
        modifier(StyledText(
            font: font,
            truncationMode: truncationMode,
            lineLimit: lineLimit,
            textAlignment: textAlignment,
            foregroundColor: foregroundColor,
            maxWidth: maxWidth
        ))
    }
}
