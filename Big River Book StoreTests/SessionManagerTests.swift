//
//  SessionManagerTests.swift
//  Big River Book StoreTests
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import Big_River_Book_Store

class SessionManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGettingBooksData() {
        let exp = expectation(description: "Expecting JSON data not to be nil")
        SessionManager.getBooks { (data, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            guard let error = error else { return }
            XCTFail("error: \(error.localizedDescription)")
        }
    }

}
