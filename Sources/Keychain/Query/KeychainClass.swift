//
//  KeychainClass.swift
//  Utilities
//
//  Created by Ben Shutt on 12/01/2025.
//

import Security

public enum KeychainClass: KeychainConstant {
    case genericPassword // Primary keys: kSecAttrAccount and kSecAttrService.

    public var cfString: CFString {
        switch self {
        case .genericPassword: kSecClassGenericPassword
        }
    }
}
