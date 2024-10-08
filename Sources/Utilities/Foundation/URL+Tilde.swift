//
//  URL+Tilde.swift
//  Utilities
//
//  Created by Ben Shutt on 16/07/2024.
//

import Foundation

public extension URL {
    init(expandingTildeInFilePath filePath: String) {
        self.init(filePath: filePath.expandingTildeInPath)
    }
}

// MARK: - String + Tilde

private extension String {
    var expandingTildeInPath: String {
        NSString(string: self).expandingTildeInPath
    }
}
