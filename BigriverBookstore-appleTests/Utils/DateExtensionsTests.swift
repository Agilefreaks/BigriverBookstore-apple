//
//  DateExtensionsTests.swift
//  BigriverBookstore-appleTests
//
//  Created by Viorel Porumbescu on 08/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
@testable import BigriverBookstore_apple

import XCTest

class DateExtensionsTests: XCTestCase {
    var date: Date?

    override func setUp() {
        date = Date(timeIntervalSince1970: 0)
    }

    func testDateFormatyyyymmdd() {
        XCTAssertNotNil(date)
        XCTAssertEqual(date!.stringWith(format: .yyyymmdd), "1970-01-01")
    }

    func testDateFormatmmddyyyy() {
        XCTAssertNotNil(date)
        XCTAssertEqual(date!.stringWith(format: .mmddyyyy), "01-01-1970")
    }
}
