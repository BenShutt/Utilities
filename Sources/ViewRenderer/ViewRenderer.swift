//
//  ViewRenderer.swift
//  ViewRenderer
//
//  Created by Ben Shutt on 16/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import SwiftUI

@MainActor public protocol ViewRenderer {
    var scale: CGFloat { get }
    var size: CGSize? { get }
}

public extension ViewRenderer {
    var scale: CGFloat { 1 }
    var size: CGSize? { nil }

    private var proposedSize: ProposedViewSize {
        if let size {
            ProposedViewSize(width: size.width, height: size.height)
        } else {
            .unspecified
        }
    }

    func renderer<Content: View>(
        content: Content
    ) -> ImageRenderer<Content> {
        let renderer = ImageRenderer(content: content)
        renderer.scale = scale
        renderer.proposedSize = proposedSize
        return renderer
    }
}
