//
//  String+Extensions.swift
//  Utilities
//
//  Created by Ben Shutt on 11/09/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import Foundation

public extension String {

    /// Shorthand computed property for trimming whitespaces and new lines
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Returns `nil` when `isEmpty` is true, otherwise returns `self`
    var nilIfEmpty: String? {
        isEmpty ? nil : self
    }
}
