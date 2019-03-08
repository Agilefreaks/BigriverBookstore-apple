//
//  BookTest.swift
//  BigriverBookstore-appleTests
//
//  Created by Viorel Porumbescu on 06/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
@testable import BigriverBookstore_apple
import XCTest

class BookTests: XCTestCase {
    var book: Book?

    override func setUp() {
        book = Book.init(with: "Book title", author: Author.init(with: "Author name"), publishingDate: Date.init(), photos: [])
    }

    func testBookContructor() {
        XCTAssertNotNil(book)
        XCTAssertEqual(book!.title, "Book title", "Invalid book title")
        XCTAssertEqual(book!.author.name, "Author name", "Invalid author name")
        XCTAssert(book!.photos.isEmpty)
    }
}
