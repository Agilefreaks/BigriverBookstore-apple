//
//  BookDetailViewModel.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class BookDetailViewModel {
    // MARK: - Variables

    var book: Book?
    var id: String = ""
    private let repository: BookRepositoryProtocol

    // MARK: - Lifecycle

    init(with id: String, repository: BookRepositoryProtocol = BookRepository()) {
        self.id = id
        self.repository = repository
    }

    // MARK: - Helpers

    func getBook(completion block: @escaping (Error?) -> Void) {
        repository.get(with: id) { [weak self] book, error in
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
}
