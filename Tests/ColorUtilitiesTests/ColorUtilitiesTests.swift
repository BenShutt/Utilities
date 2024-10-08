//
//  ColorUtilitiesTests.swift
//  ColorUtilitiesTests
//
//  Created by Ben Shutt on 16/07/2024.
//

import XCTest
import SwiftUI
@testable import ColorUtilities

final class ColorUtilitiesTests: XCTestCase {
    func testHexString() {
        TestColor.allCases.forEach { testColor in
            XCTAssertEqual(
                testColor.expectedColor.hex(),
                testColor.expectedHex + "FF"
            )
        }
    }

    func testHexStringWithoutOpacity() {
        TestColor.allCases.forEach { testColor in
            XCTAssertEqual(
                testColor.expectedColor.hex(opacity: false),
                testColor.expectedHex
            )
        }
    }

    func testHexInit() throws {
        try TestColor.allCases.forEach { testColor in
            let color = Color(hex: testColor.expectedHex + "FF")
            guard let color else { throw TestError.optionalNil }
            XCTAssertEqual(color, testColor.expectedColor)
        }
    }

    func testHexInitWithOpacity() throws {
        try TestColor.allCases.forEach { testColor in
            let color = Color(hex: testColor.expectedHex + "80") // 50%
            guard let color else { throw TestError.optionalNil }
            XCTAssertEqual(color.hex(), testColor.expectedColor.opacity(0.5).hex())
        }
    }

    func test255() {
        TestColor.allCases.forEach { testColor in
            let color255 = Color(
                red255: testColor == .red ? 255 : 0,
                green: testColor == .green ? 255 : 0,
                blue: testColor == .blue ? 255 : 0,
                opacity: 51 // 20%
            )
            let color = testColor.expectedColor.opacity(0.2)
            XCTAssertEqual(color255.hex(), color.hex())
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
