//
//  BlurView.swift
//  Utilities
//
//  Created by Ben Shutt on 27/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import SwiftUI

#if os(iOS)

/// A `UIViewRepresentable` wrapping a `UIVisualEffectView`
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .regular

    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#endif
