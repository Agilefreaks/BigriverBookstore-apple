//
//  APIConexion.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation
import Spine


public class APIConexion {
    
    static let baseURL = URL.init(string: "http://jsonapiplayground.reyesoft.com")!
    
    static let booksPath: String = "v2/books"
    
    static let spine  = Spine.init(baseURL: baseURL)
    
    static func retrieveBookList(completionHandler:(([Book])->Void)? ) {
        spine.registerResource(Book.self)
        
        let booksQuery = Query.init(resourceType: Book.self,
                               path: booksPath)
        
        spine.find(booksQuery).onSuccess { (arg0) in
            let (resources, _, _) = arg0
            var books = [Book]()
            resources.forEach({ (res) in
                if let currentBook = res as? Book {
                    books.append(currentBook)
                }
            })
            completionHandler?(books)
        }
    }
    
}
