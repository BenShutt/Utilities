//
//  SecureData.swift
//  Utilities
//
//  Created by Ben Shutt on 12/01/2025.
//

import Foundation

typealias Model = Sendable & Equatable & Hashable & Codable

public struct SecureData: Model, KeychainModel {
    public struct PrimaryKeys: Model, KeychainPrimaryKeysModel {
        public var service: String
        public var account: String

        public init(
            service: String,
            account: String
        ) {
            self.service = service
            self.account = account
        }

        public var fetchQuery: KeychainQuery {
            KeychainQuery()
                .class(.genericPassword)
                .attrService(service)
                .attrAccount(account)
                .matchLimit(.one)
                .returnData(true)
        }

        public var deleteQuery: KeychainQuery {
            KeychainQuery()
                .class(.genericPassword)
                .attrService(service)
                .attrAccount(account)
        }
    }

    public var service: String
    public var account: String
    public var data: Data

    public var keys: PrimaryKeys {
        .init(
            service: service,
            account: account
        )
    }

    public init(
        service: String,
        account: String,
        data: Data
    ) {
        self.service = service
        self.account = account
        self.data = data
    }

    public init(ref: Data, keys: PrimaryKeys) {
        self.service = keys.service
        self.account = keys.account
        self.data = ref
    }

    // MARK: - KeychainItem
    
    public var addQuery: KeychainQuery {
        KeychainQuery()
            .class(.genericPassword)
            .attrService(service)
            .attrAccount(account)
            .valueData(data)
    }
    
    public var updateQuery: KeychainQuery {
        KeychainQuery()
            .class(.genericPassword)
            .attrService(service)
            .attrAccount(account)
    }
    
    public var updateAttributes: KeychainQuery {
        KeychainQuery()
            .valueData(data)
    }
}
