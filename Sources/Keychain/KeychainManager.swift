//
//  KeychainManager.swift
//  Keychain
//
//  Created by Ben Shutt on 11/01/2025.
//

import Foundation

/// Wrapper for storing secure data into the Keychain.
/// E.g. an authentication token.
@KeychainActor
public enum KeychainManager {

    // MARK: - KeychainModel

    public static func fetch<T: KeychainModel>(
        _ keys: T.PrimaryKeys
    ) throws(KeychainError) -> T {
        try T(ref: fetch(query: keys.fetchQuery), keys: keys)
    }

    public static func add<T: KeychainModel>(
        _ model: T
    ) throws(KeychainError) {
        try add(query: model.addQuery)
    }

    public static func update<T: KeychainModel>(
        _ model: T,
        addIfNotFound: Bool = true
    ) throws(KeychainError) {
        do {
            try update(
                query: model.updateQuery,
                attributes: model.updateAttributes
            )
        } catch {
            if addIfNotFound && error.status == errSecItemNotFound {
                try add(model)
            }
        }
    }

    public static func delete<T: KeychainPrimaryKeysModel>(
        _ keys: T,
        throwIfNotFound: Bool = false
    ) throws(KeychainError) {
        try delete(
            query: keys.deleteQuery,
            throwIfNotFound: throwIfNotFound
        )
    }

    // MARK: - Query

    public static func fetch<T>(
        query: KeychainQuery
    ) throws(KeychainError) -> T {
        var item: CFTypeRef?
        try check(status: SecItemCopyMatching(
            query.cfQuery,
            &item
        ))
        guard let value = item as? T else {
            throw KeychainError.invalidReference
        }
        return value
    }

    public static func add(
        query: KeychainQuery
    ) throws(KeychainError) {
        try check(status: SecItemAdd(
            query.cfQuery,
            nil
        ))
    }

    public static func update(
        query: KeychainQuery,
        attributes: KeychainQuery
    ) throws(KeychainError) {
        try check(status: SecItemUpdate(
            query.cfQuery,
            attributes.cfQuery
        ))
    }

    public static func delete(
        query: KeychainQuery,
        throwIfNotFound: Bool = false
    ) throws(KeychainError) {
        do {
            try check(status: SecItemDelete(
                query.cfQuery
            ))
        } catch {
            if throwIfNotFound || error.status != errSecItemNotFound {
                throw error
            }
        }
    }

    // MARK: - Helper

    private static func check(
        status: OSStatus
    ) throws(KeychainError) {
        guard status == errSecSuccess else {
            throw KeychainError.invalidStatus(status)
        }
    }
}
