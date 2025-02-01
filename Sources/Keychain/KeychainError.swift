//
//  KeychainError.swift
//  Keychain
//
//  Created by Ben Shutt on 11/01/2025.
//

import Foundation

/// `Error`s thrown in Keychain operations
public enum KeychainError: Error {

    /// The given status was not valid
    case invalidStatus(_ status: OSStatus)

    /// The reference returned from the Keychain was invalid
    case invalidReference

    /// Get the status when the error is type `invalidStatus`
    public var status: OSStatus? {
        guard case .invalidStatus(let status) = self else { return nil }
        return status
    }
}

// MARK: - OSStatus + Extensions

public extension OSStatus {

    /// A human readable message for the status.
    var message: String {
        (SecCopyErrorMessageString(self, nil) as String?) ?? String(self)
    }
}
