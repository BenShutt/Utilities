//
//  PNGRenderer.swift
//  ViewRenderer
//
//  Created by Ben Shutt on 16/07/2024.
//

import SwiftUI

/// Renders a PNG image from a SwiftUI view
@MainActor
public struct PNGRenderer: ViewRenderer {
    public var scale: CGFloat
    public var size: CGSize?

    public init(
        scale: CGFloat = 1,
        size: CGSize? = nil
    ) {
        self.scale = scale
        self.size = size
    }

    public func pngData(content: some View) throws -> Data {
        let pngData = renderer(content: content).pngData()
        guard let pngData else { throw PNGRendererError.pngData }
        return pngData
    }
}

// MARK: - PNGRendererError

public enum PNGRendererError: Error {
    case pngData
}

// MARK: - ImageRenderer + PNG

public extension ImageRenderer {

    @MainActor
    func pngData() -> Data? {
#if os(iOS)
        uiImage?.pngData()
#elseif os(macOS)
        guard let tiff = nsImage?.tiffRepresentation else { return nil }
        guard let tiffData = NSBitmapImageRep(data: tiff) else { return nil }
        return tiffData.representation(using: .png, properties: [:])
#else
        nil
#endif
    }
}
