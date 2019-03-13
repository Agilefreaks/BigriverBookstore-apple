//
//  BookDetailViewModel.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

enum BookDetailTypeCell: Int {
    case title
    case author
    case store
    case publishDate
    case price
}

class BookDetailViewModel {
    // MARK: - Variables

    private var book: BookDetail?
    private var id: String = ""
    private let repository: BookRepositoryProtocol
    private var cellTypes: [BookDetailTypeCell] {
        var computedCellTypes: [BookDetailTypeCell] = [.title, .publishDate, .price]
        if book?.author != nil {
            computedCellTypes.append(.author)
        }
        if book?.store != nil {
            computedCellTypes.append(.store)
        }
        return computedCellTypes
    }

    // MARK: - Lifecycle

    init(with id: String, repository: BookRepositoryProtocol = BookRepository()) {
        self.id = id
        self.repository = repository
    }

    // MARK: - Helpers

    func getBook(completion block: @escaping (Error?) -> Void) {
        let includeArray = ["photos", "author", "stores"]
        repository.get(include: includeArray, resourceID: id) { [weak self] book, error in
            guard let strongSelf = self else {
                block(CustomError.generalError)
                return
            }
            guard error == nil, let book = book else {
                block(error!)
                return
            }
            strongSelf.book = book
            block(nil)
        }
    }

    func numberOfPhotos() -> Int {
        guard let imageUrls = book?.imageUrls else { return 0 }
        return imageUrls.count
    }

    func photoUrl(at indexPath: IndexPath) -> String? {
        guard let imageUrls = book?.imageUrls else { return nil }
        return imageUrls[indexPath.item]
    }

    func nameOfBook() -> String? {
        guard let book = book else { return nil }
        return book.title
    }

    func getCellTypesCount() -> Int {
        return cellTypes.count
    }

    func getCellDetail(for indexPath: IndexPath) -> String {
        guard let book = book else { return "" }
        let index = indexPath.row
        guard let type = BookDetailTypeCell(rawValue: index) else { return "" }
        switch type {
        case .title:
            return "Title: \(book.title)"
        case .author:
            guard let author = book.author else { return "" }
            return "Author: \(author.name)"
        case .price:
            return "Price: \(String(format: "%.02f", book.price)) €"
        case .store:
            guard let store = book.store else { return "" }
            return "Store: \(store.name)"
        case .publishDate:
            return "Publish date: \(book.datePublished)"
        }
    }
}
