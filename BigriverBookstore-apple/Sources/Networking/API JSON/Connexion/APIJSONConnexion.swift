//
//  APIConexion.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
import Foundation
import Spine

class APIJSONConnexion: APIService {
    let spine = Spine(baseURL: NetworkingConstants.baseURL)

    lazy var registerResources: () = {
        self.spine.registerResource(BookJSON.self)
        self.spine.registerResource(AuthorJSON.self)
        self.spine.registerResource(PhotoJSON.self)
    }()

    func retrieveBookList(completionHandler: (([Book]) -> Void)?) {
        _ = registerResources
        var booksQuery = Query(resourceType: BookJSON.self, path: NetworkingConstants.booksPath)
        booksQuery.paginate(PageBasedPagination(pageNumber: 1, pageSize: 45))
        booksQuery.include("author")
        booksQuery.include("photos")

        spine.find(booksQuery).onSuccess { arg0 in
            let (resources, _, _) = arg0
            completionHandler?(resources.compactMap({ (Book(jsonBook: $0 as? BookJSON)) }))
        }.onFailure { error in
            print(error)
        }
    }

    func retrieveBookListOf(author: Author, completionHandler: (([Book]) -> Void)?) {
        _ = registerResources
        let path = NetworkingConstants.authorsPath + "/" + author.id + "/books"
        var booksQuery = Query(resourceType: BookJSON.self, path: path)
        booksQuery.paginate(PageBasedPagination(pageNumber: 1, pageSize: 45))
        booksQuery.include("photos")

        spine.find(booksQuery).onSuccess { arg0 in
            let (resources, _, _) = arg0
            completionHandler?(resources.compactMap({ (Book(jsonBook: $0 as? BookJSON, forAuthor: author)) }))
        }.onFailure { error in
            print(error)
        }
    }
}
