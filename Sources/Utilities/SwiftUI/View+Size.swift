//
//  View+Size.swift
//  Utilities
//
//  Created by Ben Shutt on 18/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import SwiftUI

public extension View {
    func onSizeChange(
        _ action: @escaping (CGSize) -> Void
    ) -> some View {
        background(
            GeometryReader { proxy in
                Color.clear.preference(
                    key: SizePreferenceKey.self,
                    value: proxy.size
                )
            }
        )
        .onPreferenceChange(SizePreferenceKey.self) { value in
            action(value)
        }
    }

    func onWidthChange(_ binding: Binding<CGFloat>) -> some View {
        onSizeChange { binding.wrappedValue = $0.width }
    }

    func onHeightChange(_ binding: Binding<CGFloat>) -> some View {
        onSizeChange { binding.wrappedValue = $0.height }
    }
}

// MARK: - SizePreferenceKey

public struct SizePreferenceKey: PreferenceKey {
    public static var defaultValue: CGSize = .zero
    public static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
