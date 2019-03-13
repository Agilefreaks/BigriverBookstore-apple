//
//  BookDetail.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 13/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct BookDetail {
    let id: String
    let title: String
    let datePublished: String
    let author: Author?
    let store: Store?
    let price: Float
    let imageUrls: [String]

    static func from(_ bookResource: BookResource) -> BookDetail {
        return BookDetail(id: bookResource.id,
                          title: bookResource.title,
                          datePublished: bookResource.datePublished,
                          author: bookResource.author != nil ? Author.from(bookResource.author!) : nil,
                          store: bookResource.stores?.first != nil ? Store.from(bookResource.stores!.first!) : nil,
                          price: Float.random(in: 1 ..< 10),
                          imageUrls: bookResource.photos != nil ? bookResource.photos!.compactMap({ $0.uri }) : [])
    }
}
