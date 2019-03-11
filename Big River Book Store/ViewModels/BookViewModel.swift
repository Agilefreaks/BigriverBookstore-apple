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
    
    var title: String {
        get {
            guard let title = book.title else { return "" }
            return title
        }
    }
    var author: String {
        get {
            guard let author = book.author?.name else { return "" }
            return author
        }
    }
    var mainPhotoURL: String? {
        get {
            guard let photos = book.photos else { return nil }
            return photos.first?.uri
        }
    }
    
    init(with book: Book) {
        self.book = book
    }
}
