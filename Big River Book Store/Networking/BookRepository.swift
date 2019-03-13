//
//  BookRepository.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class BookRepository: BookRepositoryProtocol {
    func getAll(include: [String], completion block: @escaping ([Book]?, Error?) -> Void) {
        let includeList = include.joined(separator: ",")
        SessionManager.getResources(type: BookResource.self, path: .books, includeList: includeList) { resources, error in
            guard error == nil, let bookResources = resources else {
                block(nil, error)
                return
            }
            block(bookResources.compactMap({ Book(with: $0) }), nil)
        }
    }

    func get(include: [String], resourceID: String, completion block: @escaping (Book?, Error?) -> Void) {
        let includeList = include.joined(separator: ",")
        SessionManager.getResource(type: BookResource.self, path: .books, includeList: includeList, resourceID: resourceID) { resource, error in
            guard error == nil, let bookResource = resource else {
                block(nil, error)
                return
            }
            block(Book(with: bookResource), nil)
        }
    }
}
