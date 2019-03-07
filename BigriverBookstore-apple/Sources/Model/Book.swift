//
//  Book.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Spine

struct Book {
    let title: String
    let author: Author
    let photos: [Photo]

    init(with title: String, author: Author, photos: [Photo]) {
        self.title = title
        self.author = author
        self.photos = photos
    }

    init(jsonBook: BookJSON?) {
        let bookTitle = jsonBook?.title ?? ""
        let bookAuthor = Author(jsonAuthor: jsonBook?.author)
        let photos = jsonBook?.photos?.resources.compactMap({ (Photo(jsonPhoto: $0 as? PhotoJSON)) }) ?? [Photo]()
        self.init(with: bookTitle, author: bookAuthor, photos: photos)
    }
}
