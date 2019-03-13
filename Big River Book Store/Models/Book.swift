//
//  Book.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct Book {
    var id: String
    var title: String
    var author: String
    var imageUrls: [String]

    init(with bookResource: BookResource) {
        id = bookResource.id
        title = bookResource.title
        author = bookResource.author?.name ?? ""
        if let photos = bookResource.photos {
            imageUrls = photos.compactMap({ $0.uri })
        } else {
            imageUrls = []
        }
    }
}
