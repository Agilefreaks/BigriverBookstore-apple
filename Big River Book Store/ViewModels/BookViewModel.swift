//
//  BookViewModel.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class BookViewModel {
    private var book: Book!

    var title: String { return book.title }
    var author: String { return book.author }
    var mainPhotoURL: String? { return book.imageUrls.first }

    init(with book: Book) {
        self.book = book
    }
}
