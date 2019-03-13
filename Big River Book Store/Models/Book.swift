//
//  Book.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct Book {
    let id: String
    let title: String
    let author: String
    let imageUrls: [String]

    static func from(_ bookResource: BookResource) -> Book {
        return Book(id: bookResource.id,
                    title: bookResource.title,
                    author: bookResource.author?.name ?? "",
                    imageUrls: bookResource.photos != nil ? bookResource.photos!.compactMap({ $0.uri }) : [])
    }
}
