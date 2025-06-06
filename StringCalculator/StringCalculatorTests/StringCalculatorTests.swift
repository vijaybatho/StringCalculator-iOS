//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Vijay Batho on 05/06/25.
//

import XCTest
@testable import StringCalculator

final class StringCalculatorTests: XCTestCase {

    var calculator: StringCalculator!

    override func setUp() {
        super.setUp()
        calculator = StringCalculator()
    }

    func testEmptyStringReturnsZero() {
        XCTAssertEqual(try calculator.add(""), 0)
    }
    
    func testSingleNumberReturnsSameNumber() {
        XCTAssertEqual(try calculator.add("5"), 5)
    }
    
    func testMultipleNumbersSeparatedByCommaOrNewLine() {
        XCTAssertEqual(try calculator.add("1,2\n3"), 6)
    }

    func testCustomDelimiter() {
        XCTAssertEqual(try calculator.add("//;\n1;2"), 3)
    }

}
