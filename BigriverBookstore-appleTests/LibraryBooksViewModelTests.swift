//
//  LibraryBooksViewModelTests.swift
//  BigriverBookstore-appleTests
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
@testable import BigriverBookstore_apple
import XCTest

class LibraryBooksViewModelTests: XCTestCase {
    var library: LibraryBooksViewModel?

    override func setUp() {
        library = LibraryBooksViewModel(with: APIServiceTests())
    }

    func testBookLibraryLoading() {
        let expectdata = expectation(description: "Wait 5 sec")
        library?.refreshData = {
            expectdata.fulfill()
        }
        library?.loadBookList()
        XCTAssertNotNil(library)
        XCTAssert(XCTWaiter().wait(for: [expectdata], timeout: 5) == .completed)
        XCTAssertEqual(library!.currentBookList.count, 1)
    }
}
