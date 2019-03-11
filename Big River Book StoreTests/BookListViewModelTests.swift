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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    let bookListViewModel = BookListViewModel.init(books: [Book(), Book(), Book()])

    func testReturnNumberOfBooks() {
        XCTAssertEqual(3, bookListViewModel.numberOfBooks())
    }
    
    func testBookAtIndexPath() {
        XCTAssertNotNil(bookListViewModel.book(at: IndexPath(item: 1, section: 0)), "Book at index path")
    }

}
