//
//  EdgeInsets+Extensions.swift
//  Utilities
//
//  Created by Ben Shutt on 16/07/2024.
//

import SwiftUI

public extension EdgeInsets {
    static let zero = EdgeInsets(0)

    init(_ value: CGFloat) {
        self.init(
            top: value,
            leading: value,
            bottom: value,
            trailing: value
        )
    }

    init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self.init(
            top: vertical,
            leading: horizontal,
            bottom: vertical,
            trailing: horizontal
        )
    }

    var vertical: CGFloat {
        top + bottom
    }

    var horizontal: CGFloat {
        leading + trailing
    }
}
