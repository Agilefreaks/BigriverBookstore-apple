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
    
    var bookViewModel: BookViewModel!
    
    override func setUp() {
        let book = Book(id: "42", title: "War and Peace", author: "Leo Tolstoy", imageUrls: ["www.flickr.com/flower", "www.google.com"])
        bookViewModel = BookViewModel(with: book)
    }
    
    func testBookViewModelHasTitle() {
        XCTAssert(bookViewModel.title == "War and Peace")
    }
    
    func testBookViewModelHasAuthor() {
        XCTAssert(bookViewModel.author == "Leo Tolstoy")
    }
    
    func testBookViewModelHasMainPhoto() {
        XCTAssert(bookViewModel.mainPhotoURL == "www.flickr.com/flower")
    }
    
}
