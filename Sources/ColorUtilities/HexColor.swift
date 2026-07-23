// swiftlint:disable no_magic_numbers
import SwiftUI

public struct HexColor: Hashable, Sendable {
    public var color: Color

    public init(color: Color) {
        self.color = color
    }
}

public extension HexColor {
    init(_ int: UInt32) {
        color = .init(
            red: Double((int >> 16) & 0xFF) / 255,
            green: Double((int >> 8) & 0xFF) / 255,
            blue: Double(int & 0xFF) / 255,
        )
    }

    init?(_ string: String) {
        var hex = string
        if hex.hasPrefix("#") { hex.removeFirst() }
        guard hex.count == 6 else { return nil }
        guard let value = UInt32(hex, radix: 16) else { return nil }
        self.init(value)
    }
}

extension HexColor: Decodable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        guard let hexColor = HexColor(string) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid \(HexColor.self): \(string)",
            )
        }
        self = hexColor
    }
}
// swiftlint:enable no_magic_numbers
