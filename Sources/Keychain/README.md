# Keychain

Fetch, add, update, and delete secure data from the [keychain](https://developer.apple.com/documentation/security/keychain-services?language=objc).

[kSecClassGenericPassword](https://developer.apple.com/documentation/security/ksecclassgenericpassword)

This package provides an implementation for common queries for `SecureData`:  

```swift
struct SecureData: Sendable, Equatable, Hashable, Codable {
    var service: String
    var account: String
    var data: Data
```

For example:

```swift
try KeychainManager.add(secureData)
let secureData: SecureData = try KeychainManager.fetch(keys)
try KeychainManager.delete(keys, throwIfNotFound: false)
try KeychainManager.update(secureData, addIfNotFound: true)
```

## Note

Be conscious not to access the keychain before it is available. See [SO](https://stackoverflow.com/a/61313746).

## References

- [Storing CryptoKit Keys in the Keychain](https://developer.apple.com/documentation/cryptokit/storing_cryptokit_keys_in_the_keychain)
- [SO](https://stackoverflow.com/a/68232091)
