//
//  KeychainQuery.swift
//  Utilities
//
//  Created by Ben Shutt on 12/01/2025.
//

import Foundation
import Security

public struct KeychainQuery {
    public let query: [String: Any]

    var cfQuery: CFDictionary {
        query as CFDictionary
    }

    public init() {
        self.init(query: [:])
    }

    private init(query: [String: Any]) {
        self.query = query
    }
}

// MARK: - Builder

public extension KeychainQuery {
    func `class`(_ value: KeychainClass) -> Self {
        set(key: kSecClass, value: value.value)
    }

    func attrAccount(_ value: String) -> Self {
        set(key: kSecAttrAccount, value: value)
    }

    func attrService(_ value: String) -> Self {
        set(key: kSecAttrService, value: value)
    }

    func matchLimit(_ value: KeychainMatchLimit) -> Self {
        set(key: kSecMatchLimit, value: value.value)
    }

    func returnData(_ value: Bool) -> Self {
        set(key: kSecReturnData, value: value)
    }

    func valueData(_ value: Data) -> Self {
        set(key: kSecValueData, value: value)
    }

    func set(key: CFString, value: Any) -> Self {
        var newQuery = query
        newQuery[key as String] = value
        return .init(query: newQuery)
    }
}
