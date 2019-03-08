//
//  Book.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//
import Foundation

struct Book {
    let title: String
    let author: Author
    let publishingDate: Date
    let photos: [Photo]

    init(with title: String, author: Author, publishingDate: Date, photos: [Photo]) {
        self.title = title
        self.author = author
        self.publishingDate = publishingDate
        self.photos = photos
    }

    init?(jsonBook: BookJSON?) {
        guard let bookTitle = jsonBook?.title,
            let bookAuthor = Author(jsonAuthor: jsonBook?.author),
            let date = jsonBook?.publishDate,
            let photos = jsonBook?.photos?.resources.compactMap({ (Photo(jsonPhoto: $0 as? PhotoJSON)) }) else {
            return nil
        }
        self.title = bookTitle
        self.author = bookAuthor
        self.publishingDate = date
        self.photos = photos
    }
}
