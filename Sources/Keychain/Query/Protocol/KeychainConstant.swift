//
//  KeychainConstant.swift
//  Utilities
//
//  Created by Ben Shutt on 12/01/2025.
//

import Security

public protocol KeychainConstant {
    var cfString: CFString { get }
}

public extension KeychainConstant {
    var value: String {
        cfString as String
    }
}
