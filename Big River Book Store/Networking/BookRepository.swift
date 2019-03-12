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
                block(nil, CustomError.generalError)
                return
            }
            block(bookResources.compactMap({ Book(with: $0) }), nil)
        }
    }
}
