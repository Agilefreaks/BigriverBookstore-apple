//
//  BookRepository.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class BookRepository: BookRepositoryProtocol {
    func getAll(completion block: @escaping ([Book]?, Error?) -> Void) {
        SessionManager.getResources(type: BookResource.self, path: URLCreator.books, include: ["author", "photos"]) { resources, error in
            guard error == nil, let bookResources = resources else {
                block(nil, error)
                return
            }
            block(bookResources.compactMap({ Book(with: $0) }), nil)
        }
    }

    func get(with id: String, completion block: @escaping (Book?, Error?) -> Void) {
        SessionManager.getResource(type: BookResource.self, path: URLCreator.books, id: id, include: ["author", "photos", "stores"]) { resource, error in
            guard error == nil, let bookResource = resource else {
                block(nil, error)
                return
            }
            block(Book(with: bookResource), nil)
        }
    }
}
