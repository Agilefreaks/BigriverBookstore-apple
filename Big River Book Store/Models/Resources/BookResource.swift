//
//  Book.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Japx

struct BookResource: JapxCodable {
    var type: String
    var id: String
    var title: String
    var datePublished: String
    var isbn: Int
    var author: AuthorResource?
    var photos: [PhotoResource]?
    var stores: [StoreResource]?

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case title
        case datePublished = "date_published"
        case isbn
        case author
        case photos
        case stores
    }
}
