//
//  JSONEncoder+Pretty.swift
//  Utilities
//
//  Created by Ben Shutt on 29/07/2024.
//

import Foundation

public extension JSONEncoder {
    static let pretty = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = [
            .prettyPrinted,
            .sortedKeys,
            .withoutEscapingSlashes
        ]
        return encoder
    }()
}
