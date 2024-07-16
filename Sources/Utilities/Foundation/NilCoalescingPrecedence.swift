//
//  NilCoalescingPrecedence.swift
//  Utilities
//
//  Created by Ben Shutt on 16/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import Foundation

infix operator ?!: NilCoalescingPrecedence

/// Throws the right hand side error if the left hand side optional is `nil`.
public func ?!<T>(
    value: T?,
    error: @autoclosure () -> Error
) throws -> T {
    if let value { value } else { throw error() }
}
