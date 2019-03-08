//
//  AuthorTests.swift
//  BigriverBookstore-appleTests
//
//  Created by Viorel Porumbescu on 06/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
@testable import BigriverBookstore_apple
import XCTest

class AuthorTests: XCTestCase {
    var author: Author?
    override func setUp() {
        author = Author(with: "Author name", id: "0")
    }

    func testAuthorConstructor() {
        XCTAssertNotNil(author)
        XCTAssertEqual(author!.name, "Author name")
        XCTAssertEqual(author!.id, "0")
    }
}
