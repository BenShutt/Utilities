//
//  KeychainMatchLimit.swift
//  Utilities
//
//  Created by Ben Shutt on 12/01/2025.
//

import Security

public enum KeychainMatchLimit: KeychainConstant {
    case one

    public var cfString: CFString {
        switch self {
        case .one: kSecMatchLimitOne
        }
    }
}
