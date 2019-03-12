//
//  BookListViewModel.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class BookListViewModel {
    
    // MARK: - Variables
    private var books: [Book] = []
    private let repository: BookRepositoryProtocol
    
    // MARK: - Lifecycle
    init(repository: BookRepositoryProtocol = BookRepository()) {
        self.repository = repository
    }
    
    // MARK: - Helpers
    func getBooks(completion block: @escaping (Error?) -> Void) {
        repository.getAll { [weak self] (books, error) in
            guard let strongSelf = self else {
                block(CustomError.generalError)
                return
            }
            guard error == nil else {
                block(error)
                return
            }
            strongSelf.books = books ?? []
            block(nil)
        }
    }
    
    func numberOfBooks() -> Int {
        return books.count
    }
    
    func bookViewModel(at indexPath: IndexPath) -> BookViewModel? {
        guard books.count > indexPath.item else { return nil }
        return BookViewModel(with: books[indexPath.row])
    }
}
