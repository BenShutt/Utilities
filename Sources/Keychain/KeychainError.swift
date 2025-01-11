//
//  KeychainError.swift
//  Keychain
//
//  Created by Ben Shutt on 11/01/2025.
//

import Foundation

/// `Error`s thrown in Keychain operations
public enum KeychainError: Error {

    /// The given `status` was not valid
    case invalidStatus(_ status: OSStatus)

    /// The `ref` returned from the Keychain was invalid
    case invalidReference
}
