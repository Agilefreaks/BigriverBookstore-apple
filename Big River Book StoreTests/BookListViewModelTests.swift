//
//  BookListViewModelTests.swift
//  Big River Book StoreTests
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Big_River_Book_Store

class BookListViewModelTests: XCTestCase {

    var bookListViewModel: BookListViewModel!
    var bookListViewModelWithError: BookListViewModel!

    override func setUp() {
        bookListViewModel = BookListViewModel.init(repository: MockBookRepository())
        bookListViewModelWithError = BookListViewModel.init(repository: MockBookRepository(error: true))
    }

    func testNumberOfBooks_With3Books_Returns3() {
        let exp = expectation(description: "return books")
        bookListViewModel.getBooks { (error) in
            exp.fulfill()
        }
        let result = XCTWaiter().wait(for: [exp], timeout: 5.0)
        XCTAssert(result == .completed)
        XCTAssertEqual(3, bookListViewModel.numberOfBooks())
    }

    func testBookAtIndexPath_With3Books_Returns2ndBook() {
        let exp = expectation(description: "return books")
        bookListViewModel.getBooks { (error) in
            exp.fulfill()
        }
        let result = XCTWaiter().wait(for: [exp], timeout: 5.0)
        XCTAssert(result == .completed)
        XCTAssertNotNil(bookListViewModel.bookViewModel(at: IndexPath(item: 1, section: 0)))
    }

    func testBookIdAtIndexPath_With3Books_Returns2ndBookId() {
        let exp = expectation(description: "return books")
        bookListViewModel.getBooks { (error) in
            exp.fulfill()
        }
        let result = XCTWaiter().wait(for: [exp], timeout: 5.0)
        XCTAssert(result == .completed)
        XCTAssertNotNil(bookListViewModel.bookId(at: IndexPath(item: 1, section: 0)))
    }

    func testGetBooks_WithoutError_ReturnsNilError() {
        bookListViewModel.getBooks { (error) in
            XCTAssert(error == nil)
        }
    }

    func testGetBooks_WithError_ReturnsErrorNotNil() {
        bookListViewModelWithError.getBooks { (error) in
            XCTAssert(error != nil)
        }
    }
}
