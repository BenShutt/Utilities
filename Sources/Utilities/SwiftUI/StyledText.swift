//
//  StyledText.swift
//  Utilities
//
//  Created by Ben Shutt on 16/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import SwiftUI

public struct StyledText: ViewModifier {
    public var font: Font
    public var truncationMode: Text.TruncationMode
    public var lintLimit: Int?
    public var textAlignment: TextAlignment
    public var foregroundColor: Color
    public var maxWidth: CGFloat?

    public init(
        font: Font,
        truncationMode: Text.TruncationMode = .tail,
        lintLimit: Int? = nil,
        textAlignment: TextAlignment = .center,
        foregroundColor: Color = .black,
        maxWidth: CGFloat? = nil
    ) {
        self.font = font
        self.truncationMode = truncationMode
        self.lintLimit = lintLimit
        self.textAlignment = textAlignment
        self.foregroundColor = foregroundColor
        self.maxWidth = maxWidth
    }

    private var alignment: Alignment {
        switch textAlignment {
        case .leading: .leading
        case .center: .center
        case .trailing: .trailing
        }
    }

    public func body(content: Content) -> some View {
        content
            .font(font)
            .truncationMode(truncationMode)
            .lineLimit(lintLimit)
            .multilineTextAlignment(textAlignment)
            .foregroundStyle(foregroundColor)
            .frame(maxWidth: maxWidth, alignment: alignment)
    }
}
