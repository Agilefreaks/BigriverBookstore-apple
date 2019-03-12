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
    var imageUrl: String
    
    init(with bookResource: BookResource) {
        self.id = bookResource.id ?? ""
        self.title = bookResource.title ?? ""
        self.author = bookResource.author?.name ?? ""
        self.imageUrl = bookResource.photos?.first?.uri ?? ""
    }
}
