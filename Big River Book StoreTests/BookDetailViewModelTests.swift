//
//  BookDetailViewModelTests.swift
//  Big River Book StoreTests
//
//  Created by Florin Uscatu on 13/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Big_River_Book_Store

class BookDetailViewModelTests: XCTestCase {
    
    var bookDetailViewModel: BookDetailViewModel!
    var bookDetailViewModelWithError: BookDetailViewModel!
    
    override func setUp() {
        bookDetailViewModel = BookDetailViewModel(with: "42", repository: MockBookRepository())
        bookDetailViewModelWithError = BookDetailViewModel(with: "42", repository: MockBookRepository(error: true))
    }
    
    func testNumberOfPhotos_WithNoPhotos_ReturnsZero() {
        let numberOfPhotos = bookDetailViewModel.numberOfPhotos()

        XCTAssertTrue(numberOfPhotos == 0)
    }
    
    func testPhotoAtIndexPath_With3Photos_ReturnsNotNil() {
        let exp = expectation(description: "return photo at index path")
        
        bookDetailViewModel.getBook { (error) in
            exp.fulfill()
        }
        let result = XCTWaiter().wait(for: [exp], timeout: 5.0)
        
        XCTAssert(result == .completed)
        XCTAssertNotNil(bookDetailViewModel.photoUrl(at: IndexPath(item: 1, section: 0)))
    }
    
    func testGetBook_WithoutError_ReturnsBook() {
        bookDetailViewModel.getBook { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testGetBook_WithError_ReturnsErrorNotNil() {
        bookDetailViewModelWithError.getBook { (error) in
            XCTAssertNotNil(error)
        }
    }
}
