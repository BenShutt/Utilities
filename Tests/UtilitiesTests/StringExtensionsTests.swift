//
//  StringExtensionsTests.swift
//  Utilities
//
//  Created by Ben Shutt on 08/10/2024.
//

import Testing
@testable import Utilities

@Suite struct StringExtensionsTests {
    @Test func untrimmed() {
        #expect("untrimmed".trimmed == "untrimmed")
    }

    @Test func untrimmedWithSpaces() {
        #expect("untrimmed with spaces".trimmed == "untrimmed with spaces")
    }

    @Test func leadingSpace() {
        #expect(" leading".trimmed == "leading")
    }

    @Test func trailingSpace() {
        #expect("trailing ".trimmed == "trailing")
    }

    @Test func spaces() {
        #expect(" spaces ".trimmed == "spaces")
    }

    @Test func leadingNewLine() {
        #expect("\nleading".trimmed == "leading")
    }

    @Test func trailingNewLine() {
        #expect("trailing\n".trimmed == "trailing")
    }

    @Test func newLines() {
        #expect("\nspaces\n".trimmed == "spaces")
    }

    @Test func spacesAndNewLines() {
        #expect(" \nspaces and newlines\n ".trimmed == "spaces and newlines")
    }
}
