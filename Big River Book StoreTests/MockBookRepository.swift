//
//  MockBookRepository.swift
//  Big River Book StoreTests
//
//  Created by Florin Uscatu on 13/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
@testable import Big_River_Book_Store

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
        let book = buildBook()
        block([book, book, book], nil)
    }
    
    func get(include: [String], resourceID: String, completion block: @escaping (BookDetail?, Error?) -> Void) {
        guard !error else {
            block(nil, CustomError.generalError)
            return
        }
        let book = buildBookDetail()
        block(book, nil)
    }
    
    private func buildBook() -> Book {
       return Book(id: "42",
                   title: "Title",
                   author: "author",
                   imageUrls: ["www.google.com", "www.facebook.com", "www.twitter.com"])
    }
    
    private func buildBookDetail() -> BookDetail {
        return BookDetail(id: "42",
                          title: "Title",
                          datePublished: "1975-12-04",
                          author: Author(id: "12", name: "Leo"),
                          store: Store(id: "32", name: "Diverta"),
                          price: 3.2,
                          imageUrls: ["www.google.com", "www.facebook.com", "www.twitter.com"])
    }
}
