//
//  View+Extensions.swift
//  Utilities
//
//  Created by Ben Shutt on 19/07/2024.
//  Copyright © 2024 Ben Shutt. All rights reserved.
//

import SwiftUI

public extension View {
    func frame(
        size: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        self.frame(
            width: size,
            height: size,
            alignment: alignment
        )
    }
}
