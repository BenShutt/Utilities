//
//  ColorHexTests.swift
//  ColorUtilitiesTests
//
//  Created by Ben Shutt on 16/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import XCTest
import SwiftUI
@testable import ColorUtilities

final class ColorHexTests: XCTestCase {
    let red = Color(red: 1, green: 0, blue: 0)
    let green = Color(red: 0, green: 1, blue: 0)
    let blue = Color(red: 0, green: 0, blue: 1)

    func testHexString() {
        XCTAssertEqual(red.hex(opacity: false), "#FF0000")
        XCTAssertEqual(green.hex(opacity: false), "#00FF00")
        XCTAssertEqual(blue.hex(opacity: false), "#0000FF")
    }

    func testHexStringOpacity() {
        XCTAssertEqual(red.hex(), "#FF0000FF")
        XCTAssertEqual(green.hex(), "#00FF00FF")
        XCTAssertEqual(blue.hex(), "#0000FFFF")
    }

    func testHexInit() throws {
        let red = Color(hex: "#FF0000")
        guard let red else { throw TestError.optionalNil }
        XCTAssertEqual(red, self.red)
    }
}

// MARK: - TestError

enum TestError: Error {
    case optionalNil
}
