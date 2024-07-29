//
//  JSONEncoder+Pretty.swift
//  Utilities
//
//  Created by Ben Shutt on 29/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import Foundation

public extension JSONEncoder {
    static let pretty = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [
            .prettyPrinted,
            .sortedKeys,
            .withoutEscapingSlashes
        ]
        return encoder
    }()
}
