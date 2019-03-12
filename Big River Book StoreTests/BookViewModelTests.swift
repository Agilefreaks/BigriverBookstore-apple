//
//  BookViewModelTests.swift
//  Big River Book StoreTests
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Big_River_Book_Store

class BookViewModelTests: XCTestCase {
    
    func testBookViewModelCreation() {
        let bookResource = BookResource()
        bookResource.id = "2"
        bookResource.title = "war"
        guard var book = Book(with: bookResource) else {
            XCTFail()
            return
        }
        book.title = "War and Peace"
        book.author = "Leo Tolstoy"
        book.imageUrl = "www.flickr.com/flower"
        let bookViewModel = BookViewModel(with: book)
        XCTAssert(bookViewModel.title == "War and Peace")
        XCTAssert(bookViewModel.author == "Leo Tolstoy")
        XCTAssert(bookViewModel.mainPhotoURL == "www.flickr.com/flower")
    }
}
