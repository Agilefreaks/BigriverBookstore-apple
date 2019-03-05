//
//  APIConexion.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
import Foundation
import Spine

class APIConnexion: APIService {
    let spine = Spine(baseURL: NetworkingConstants.baseURL)

    func retrieveBookList(completionHandler: (([Book]) -> Void)?) {
        spine.registerResource(Book.self)

        var booksQuery = Query(resourceType: Book.self, path: NetworkingConstants.booksPath)
        booksQuery.paginate(PageBasedPagination(pageNumber: 1, pageSize: 20))

        spine.find(booksQuery).onSuccess { arg0 in
            let (resources, _, _) = arg0
            var books = [Book]()
            resources.forEach({ res in
                if let currentBook = res as? Book {
                    books.append(currentBook)
                }
            })
            completionHandler?(books)
        }
    }
}
