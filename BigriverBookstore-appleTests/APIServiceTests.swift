//
//  APITests.swift
//  BigriverBookstore-appleTests
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
@testable import BigriverBookstore_apple
import Foundation

class APIServiceTests: APIService {
    func retrieveBookList(completionHandler: (([Book]) -> Void)?) {
        completionHandler?([Book.init(with: "Book title", author: Author.init(with: "Author name"), publishingDate: Date.init(), photos: [])])
    }
}
