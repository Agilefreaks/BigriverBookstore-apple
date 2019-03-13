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
    
    var error: Bool!
    
    init(error: Bool = false) {
        self.error = error
    }
    
    func getAll(include: [String], completion block: @escaping ([Book]?, Error?) -> Void) {
        guard !error else {
            block(nil, CustomError.generalError)
            return
        }
        let book = Book(id: "42", title: "Title", author: "author", imageUrls: [])
        block([book, book, book], nil)
    }
    
    func get(include: [String], resourceID: String, completion block: @escaping (Book?, Error?) -> Void) {
        
    }
}
