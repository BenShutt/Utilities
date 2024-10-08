//
//  String+Extensions.swift
//  Utilities
//
//  Created by Ben Shutt on 11/09/2024.
//

import Foundation

public extension String {

    /// Shorthand computed property for trimming whitespaces and new lines
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
