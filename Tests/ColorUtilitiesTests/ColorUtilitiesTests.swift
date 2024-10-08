//
//  ColorUtilitiesTests.swift
//  ColorUtilitiesTests
//
//  Created by Ben Shutt on 16/07/2024.
//

import Testing
import SwiftUI
@testable import ColorUtilities

@Suite struct ColorUtilitiesTests {
    @Test func hexString() {
        TestColor.allCases.forEach { testColor in
            #expect(
                testColor.expectedColor.hex() ==
                testColor.expectedHex + "FF"
            )
        }
    }

    @Test func hexStringWithoutOpacity() {
        TestColor.allCases.forEach { testColor in
            #expect(
                testColor.expectedColor.hex(opacity: false) ==
                testColor.expectedHex
            )
        }
    }

    @Test func hexInit() throws {
        try TestColor.allCases.forEach { testColor in
            let color = Color(hex: testColor.expectedHex + "FF")
            guard let color else { throw TestError.optionalNil }
            #expect(color == testColor.expectedColor)
        }
    }

    @Test func hexInitWithOpacity() throws {
        try TestColor.allCases.forEach { testColor in
            let color = Color(hex: testColor.expectedHex + "80") // 50%
            guard let color else { throw TestError.optionalNil }
            #expect(color.hex() == testColor.expectedColor.opacity(0.5).hex())
        }
    }

    @Test func init255() {
        TestColor.allCases.forEach { testColor in
            let color255 = Color(
                red255: testColor == .red ? 255 : 0,
                green: testColor == .green ? 255 : 0,
                blue: testColor == .blue ? 255 : 0,
                opacity: 51 // 20%
            )
            let color = testColor.expectedColor.opacity(0.2)
            #expect(color255.hex() == color.hex())
        }
    }
}

// MARK: - TestColor

private enum TestColor: CaseIterable {
    case red
    case green
    case blue

    var expectedColor: Color {
        switch self {
        case .red: Color(red: 1, green: 0, blue: 0)
        case .green: Color(red: 0, green: 1, blue: 0)
        case .blue: Color(red: 0, green: 0, blue: 1)
        }
    }

    var expectedHex: String {
        switch self {
        case .red: "#FF0000"
        case .green: "#00FF00"
        case .blue: "#0000FF"
        }
    }
}

// MARK: - TestError

private enum TestError: Error {
    case optionalNil
}
