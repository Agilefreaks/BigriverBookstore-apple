//
//  PhotoTests.swift
//  BigriverBookstore-appleTests
//
//  Created by Viorel Porumbescu on 06/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
@testable import BigriverBookstore_apple
import XCTest

class PhotoTests: XCTestCase {
    var photo: Photo?

    override func setUp() {
        photo = Photo(with: "Image title", url: URL(string: "http://image.com")!)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPhotoConstructor() {
        XCTAssertNotNil(photo)
        XCTAssertEqual(photo!.title, "Image title")
        XCTAssertEqual(photo!.url.absoluteString, "http://image.com")
    }
}
