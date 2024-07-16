//
//  Bundle+Key.swift
//  Utilities
//
//  Created by Ben Shutt on 16/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
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

    /// Object for `key` casting to `T`
    ///
    /// - Parameter key: `Bundle.Key`
    func value<T>(forKey key: Bundle.Key) -> T? {
        value(forKey: key.rawValue)
    }

    /// Object for `key` casting to `T`
    ///
    /// - Parameter key: `Bundle.Key`
    func value<T>(forKey key: String) -> T? {
        object(forInfoDictionaryKey: key) as? T
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
