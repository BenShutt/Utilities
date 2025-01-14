//
//  DateFormatter+ISO8601.swift
//  Utilities
//
//  Created by Ben Shutt on 03/08/2024.
//

import Foundation

public extension DateFormatter {

    /// ISO8601 date formatter with milliseconds
    static let iso8601Milliseconds = iso8601(
        dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    )

    /// A date formatter configured to ISO601 properties, namely:
    /// - `calendar` → Identified by `.iso8601`
    /// - `locale` → Identified by `"en_US_POSIX"`
    /// - `timeZone` → `.current`
    ///
    /// - Warning:
    /// Only to be used when `ISO8601DateFormatter` will not suffice.
    /// E.g. you want ISO8601 properties but a custom date format
    ///
    /// - Parameter dateFormat: A custom date format, defaulted
    /// - Returns: The date formatter instance
    static func iso8601(
        dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    ) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .current
        formatter.dateFormat = dateFormat
        return formatter
    }
}
