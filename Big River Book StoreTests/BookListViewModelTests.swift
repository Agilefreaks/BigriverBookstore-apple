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
        bookListViewModelWithError = BookListViewModel.init(repository: MockBookRepositoryWithError())
    }
    
    func testReturnNumberOfBooks() {
        let exp = expectation(description: "return books")
        bookListViewModel.getBooks { (error) in
            exp.fulfill()
        }
        let result = XCTWaiter().wait(for: [exp], timeout: 5.0)
        XCTAssert(result == .completed)
        XCTAssertEqual(3, bookListViewModel.numberOfBooks())
    }
    
    func testBookAtIndexPath() {
        let exp = expectation(description: "return books")
        bookListViewModel.getBooks { (error) in
            exp.fulfill()
        }
        let result = XCTWaiter().wait(for: [exp], timeout: 5.0)
        XCTAssert(result == .completed)
        XCTAssertNotNil(bookListViewModel.bookViewModel(at: IndexPath(item: 1, section: 0)))
    }
    
    func testBookIdAtIndexPath() {
        let exp = expectation(description: "return books")
        bookListViewModel.getBooks { (error) in
            exp.fulfill()
        }
        let result = XCTWaiter().wait(for: [exp], timeout: 5.0)
        XCTAssert(result == .completed)
        XCTAssertNotNil(bookListViewModel.bookId(at: IndexPath(item: 1, section: 0)))
    }
    
    func testGetBooks() {
        bookListViewModel.getBooks { (error) in
            XCTAssert(error == nil)
        }
    }
    
    func testGetBooksWithError() {
        bookListViewModelWithError.getBooks { (error) in
            XCTAssert(error != nil)
        }
    }
}

class MockBookRepository: BookRepositoryProtocol {
    func getAll(completion block: @escaping ([Book]?, Error?) -> Void) {
        let bookResource = BookResource()
        bookResource.id = "2"
        bookResource.title = "war"
        guard let book = Book(with: bookResource) else { return }
        block([book, book, book], nil)
    }
}

class MockBookRepositoryWithError: BookRepositoryProtocol {
    func getAll(completion block: @escaping ([Book]?, Error?) -> Void) {
        block(nil, CustomError.generalError)
    }
}
