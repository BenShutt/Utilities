//
//  BlurView.swift
//  Utilities
//
//  Created by Ben Shutt on 27/07/2024.
//

import SwiftUI

#if os(iOS)

/// A `UIViewRepresentable` wrapping a `UIVisualEffectView`
/// with a `UIBlurEffect`
public struct BlurView: UIViewRepresentable {
    public var style: UIBlurEffect.Style = .regular

    public init(style: UIBlurEffect.Style) {
        self.style = style
    }

    public func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(
            effect: UIBlurEffect(style: style)
        )
    }

    public func updateUIView(
        _ uiView: UIVisualEffectView,
        context: Context
    ) {}
}

#endif
