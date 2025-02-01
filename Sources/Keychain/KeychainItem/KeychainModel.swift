//
//  KeychainItem.swift
//  Utilities
//
//  Created by Ben Shutt on 12/01/2025.
//

import Foundation
import Security

public protocol KeychainModel {
    associatedtype PrimaryKeys: KeychainPrimaryKeysModel
    associatedtype ReferenceType

    var addQuery: KeychainQuery { get }
    var updateQuery: KeychainQuery { get }
    var updateAttributes: KeychainQuery { get }

    init(ref: ReferenceType, keys: PrimaryKeys)
}

public protocol KeychainPrimaryKeysModel {
    var fetchQuery: KeychainQuery { get }
    var deleteQuery: KeychainQuery { get }
}
