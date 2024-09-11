//
//  File.swift
//  Utilities
//
//  Created by Ben Shutt on 11/09/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import SwiftUI

/// The value represents a dimension in pixels
public typealias Pixels = CGFloat

/// The value represents a dimension in points
public typealias Points = CGFloat

// MARK: - CGFloat + Values

public extension CGFloat {

    /// The width and height of an iOS app icon in pixels
    static let appIconSize: Pixels = 1024

    /// Width of an A4 document in points
    static let a4Width: Points = 595

    /// Height of an A4 document in points
    static let a4Height: Points = 842
}
