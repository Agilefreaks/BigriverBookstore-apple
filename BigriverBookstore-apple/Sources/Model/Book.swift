//
//  Book.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Spine

class Book {
    var title: String
    var author: Author
    var photos: [Photo]

    init(with title: String, author: Author, photos: [Photo]) {
        self.title = title
        self.author = author
        self.photos = photos
    }

    convenience init(jsonBook: BookJSON?) {
        let bookTitle = jsonBook?.title ?? ""
        let bookAuthor = Author(jsonAuthor: jsonBook?.author)
        let photos = jsonBook?.photos?.resources.compactMap({ ( Photo.init(jsonPhoto: $0 as? PhotoJSON)) }) ?? [Photo]()
        self.init(with: bookTitle, author: bookAuthor, photos: photos)
    }
}
