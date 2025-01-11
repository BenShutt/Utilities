//
//  KeychainToken.swift
//  Keychain
//
//  Created by Ben Shutt on 11/01/2025.
//

import Foundation

/// Store a token (e.g. authentication) into the Keychain.
///
/// - Warning:
/// Consider keychain thread blocking when using this structure.
/// E.g. Use of `applicationProtectedDataDidBecomeAvailable`.
/// https://stackoverflow.com/a/61313746.
///
/// # Concurrency
/// https://developer.apple.com/documentation/security/working-with-concurrency
actor Keychain {

    /// `String.Encoding` converting from `Data` to `String` and vice versa
    public let encoding: String.Encoding = .utf8

    /// Value for key `kSecClass` in Keychain query
    public let classKey: CFString = kSecClassKey

    /// Value for key `kSecAttrApplicationTag` in Keychain query
    public let keychainIdentifier: String

    /// `Data` of `keychainIdentifier` using `encoding`
    private func keychainIdentifierData() throws -> Data {
        try keychainIdentifier.encode(with: encoding)
    }

    // MARK: - Init

    /// Initialize with `keychainIdentifier`
    ///
    /// - Parameter keychainIdentifier: `String`
    public init(keychainIdentifier: String) {
        self.keychainIdentifier = keychainIdentifier
    }

    // MARK: - Read

    /// Read token from Keychain
    public func readToken() throws -> String {
        let fetchQuery: [String: Any] = [
            kSecClass as String: classKey,
            kSecAttrApplicationTag as String: try keychainIdentifierData(),
            kSecReturnData as String: true
        ]

        var item: AnyObject?
        let status = SecItemCopyMatching(
            fetchQuery as CFDictionary,
            &item
        )

        guard status == errSecSuccess else {
            throw KeychainError.invalidStatus(status)
        }

        guard let data = item as? Data else {
            throw KeychainError.invalidReference
        }

        return try data.decodeString(with: encoding)
    }

    // MARK: - Write/Update

    /// Try `writeToken(_:)` falling back on `updateToken(_:)`
    ///
    /// - Parameter token: `String` token
    public func writeOrUpdate(_ token: String) throws {
        do {
            try writeToken(token)
        } catch {
            try updateToken(token)
        }
    }

    /// Write token to Keychain
    /// - Parameter token: `String` token
    private func writeToken(_ token: String) throws {
        let tokenData = try token.encode(with: encoding)
        let addQuery: [String: Any] = [
            kSecClass as String: classKey,
            kSecAttrApplicationTag as String: try keychainIdentifierData(),
            kSecValueData as String: tokenData
        ]
        let status = SecItemAdd(addQuery as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError.invalidStatus(status)
        }
    }

    /// Update token in Keychain
    /// - Parameter token: `String` token
    private func updateToken(_ token: String) throws {
        let tokenData = try token.encode(with: encoding)
        let updateQuery: [String: Any] = [
            kSecClass as String: classKey,
            kSecAttrApplicationTag as String: try keychainIdentifierData()
        ]
        let attributes = [
            kSecValueData as String: tokenData
        ]
        let status = SecItemUpdate(
            updateQuery as CFDictionary,
            attributes as CFDictionary
        )
        guard status == errSecSuccess else {
            throw KeychainError.invalidStatus(status)
        }
    }

    // MARK: - Delete

    /// Delete token from Keychain
    public func deleteToken() throws {
        let deleteQuery: [String: Any] = [
            kSecClass as String: classKey,
            kSecAttrApplicationTag as String: try keychainIdentifierData()
        ]
        let status = SecItemDelete(deleteQuery as CFDictionary)
        guard status == errSecSuccess else {
            throw KeychainError.invalidStatus(status)
        }
    }
}
