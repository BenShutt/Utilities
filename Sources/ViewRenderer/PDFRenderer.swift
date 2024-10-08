//
//  PDFRenderer.swift
//  ViewRenderer
//
//  Created by Ben Shutt on 16/07/2024.
//

import SwiftUI

/// Renders a PDF document from a SwiftUI view
@MainActor
public struct PDFRenderer: ViewRenderer {
    public var scale: CGFloat
    public var size: CGSize?

    public init(
        scale: CGFloat = 1,
        size: CGSize? = nil
    ) {
        self.scale = scale
        self.size = size
    }

    public func render(content: some View, to url: URL) throws {
        try renderer(content: content).renderPDF(to: url)
    }
}

// MARK: - ImageRenderer + PDF

public extension ImageRenderer {

    @MainActor
    func renderPDF(to url: URL) throws {
        var isSuccess = false

        render { size, context in
            var box = CGRect(size: size)
            let pdf = CGContext(url as CFURL, mediaBox: &box, nil)
            guard let pdf else { return }
            pdf.beginPDFPage(nil)
            context(pdf)
            pdf.endPDFPage()
            pdf.closePDF()
            isSuccess = true
        }

        if !isSuccess {
            throw ImageRendererError.renderPDF(url)
        }
    }
}

// MARK: - ImageRendererError

public enum ImageRendererError: Error {
    case renderPDF(URL)
}

// MARK: - CGRect + Extensions

private extension CGRect {
    init(size: CGSize) {
        self.init(
            x: 0,
            y: 0,
            width: size.width,
            height: size.height
        )
    }
}
