//
//  Bundle+Key.swift
//  Utilities
//
//  Created by Ben Shutt on 16/07/2024.
//

import Foundation

public extension Bundle {

    /// Fixed app keys in the `Info.plist`
    enum Key: String {

        /// Version of the app
        case appVersion = "CFBundleShortVersionString"

        /// Name of the app
        case appName = "CFBundleName"
    }

    /// Object for `key` casting to `Value`
    /// - Parameter key: `Key` in info dictionary
    func value<Value>(forKey key: Bundle.Key) -> Value? {
        value(forKey: key.rawValue)
    }

    /// Object for `key` casting to `Value`
    /// - Parameter key: `String` key in info dictionary
    func value<Value>(forKey key: String) -> Value? {
        object(forInfoDictionaryKey: key) as? Value
    }

    // MARK: - Values

    /// Value for `Key.appVersion`
    var appVersion: String? {
        value(forKey: .appVersion)
    }

    /// Value for `Key.appName`
    var appName: String? {
        value(forKey: .appName)
    }
}
