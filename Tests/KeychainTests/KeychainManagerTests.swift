//
//  KeychainTests.swift
//  Utilities
//
//  Created by Ben Shutt on 13/01/2025.
//

import Foundation
import Testing
@testable import Keychain

@KeychainActor
@Suite(
    "Unit tests for KeychainManager",
    .serialized
)
struct KeychainManagerTests {
    fileprivate let testToken = SecureData(
        service: "com.keychain.unit.tests",
        account: "test.token",
        data: Data("token".utf8)
    )

    @Test func fetch() throws {
        try runTest {
            let token = try fetchTestToken()
            #expect(token == testToken)
        }
    }

    @Test func add() throws {
        try runTest {}
    }

    @Test func updateWhenExists() throws {
        try runTest {
            let newToken = try updateTestToken("updateWhenExistsToken")
            let token = try fetchTestToken()
            #expect(token == newToken)
        }
    }

    @Test func updateWhenNotExists() throws {
        try runTest(addBefore: false) {
            let newToken = try updateTestToken("updateWhenNotExistsToken")
            let token = try fetchTestToken()
            #expect(token == newToken)
        }
    }

    @Test func deleteWhenExists() throws {
        try runTest {
            try deleteTestToken()
        }
    }

    @Test func deleteWhenNotExists() throws {
        try deleteTestToken(throwIfNotFound: false)
        #expect(performing: {
            _ = try deleteTestToken(throwIfNotFound: true)
        }, throws: { error in
            try expectNotFoundError(error)
        })
    }

    @Test func deleteAndFetch() throws {
        try runTest {
            try deleteTestToken()
            #expect(performing: {
                _ = try fetchTestToken()
            }, throws: { error in
                try expectNotFoundError(error)
            })
        }
    }

    @Test func all() throws {
        try deleteTestToken(throwIfNotFound: false)
        #expect(performing: {
            _ = try fetchTestToken()
        }, throws: { error in
            try expectNotFoundError(error)
        })

        try addTestToken()
        try #expect(fetchTestToken() == testToken)

        let testToken2 = try updateTestToken("token2")
        try #expect(fetchTestToken() == testToken2)

        let testToken3 = try updateTestToken("token3")
        try #expect(fetchTestToken() == testToken3)

        try deleteTestToken(throwIfNotFound: true)
        #expect(performing: {
            try deleteTestToken(throwIfNotFound: true)
        }, throws: { error in
            try expectNotFoundError(error)
        })
    }

    // MARK: - Helper

    private func fetchTestToken() throws -> SecureData {
        try KeychainManager.fetch(testToken.keys)
    }

    private func addTestToken() throws {
        try KeychainManager.add(testToken)
    }

    private func deleteTestToken(throwIfNotFound: Bool = false) throws {
        try KeychainManager.delete(
            testToken.keys,
            throwIfNotFound: throwIfNotFound
        )
    }

    private func updateTestToken(_ string: String) throws -> SecureData {
        var newToken = testToken
        newToken.data = Data(string.utf8)
        try KeychainManager.update(newToken)
        return newToken
    }

    private func expectNotFoundError(_ error: Error) throws -> Bool {
        let keychainError = try #require(error as? KeychainError)
        let status = try #require(keychainError.status)
        #expect(status == errSecItemNotFound)
        return true
    }

    // Needed while init and deinit do not support async
    private func runTest(
        addBefore: Bool = true,
        operation: () throws -> Void
    ) throws {
        try deleteTestToken()
        defer {
            try? deleteTestToken()
        }
        if addBefore {
            try addTestToken()
        }
        try operation()
    }
}
