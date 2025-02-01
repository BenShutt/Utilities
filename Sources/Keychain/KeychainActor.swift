//
//  KeychainActor.swift
//  Utilities
//
//  Created by Ben Shutt on 12/01/2025.
//

/// Global actor to isolate keychain calls.
/// https://developer.apple.com/documentation/security/working-with-concurrency
@globalActor
public actor KeychainActor {
    public static let shared = KeychainActor()
}
