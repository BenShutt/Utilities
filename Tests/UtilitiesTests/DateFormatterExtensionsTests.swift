//
//  DateFormatterExtensionsTests.swift
//  Utilities
//
//  Created by Ben Shutt on 08/10/2024.
//

import Testing
import Foundation
@testable import Utilities

@Suite struct DateFormatterExtensionsTests {
    private let timeZone = TimeZone(secondsFromGMT: 0)

    @Test func testISO8601Milliseconds() {
        let date = Date(timeIntervalSince1970: 1_728_381_983.569)

        let iso8601Formatter = ISO8601DateFormatter()
        iso8601Formatter.timeZone = timeZone
        let iso8601 = iso8601Formatter.string(from: date)
        #expect(iso8601 == "2024-10-08T10:06:23Z")

        let dateFormatter = DateFormatter.iso8601Milliseconds
        dateFormatter.timeZone = timeZone
        let iso8601Milliseconds = dateFormatter.string(from: date)
        #expect(iso8601Milliseconds == "2024-10-08T10:06:23.569Z")
    }
}
