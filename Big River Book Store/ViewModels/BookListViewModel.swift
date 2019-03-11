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
    private var books: [Book]?
    
    // MARK: - Lifecycle
    init() {}
    
    init(books: [Book]) {
        self.books = books
    }
    
    // MARK: - Helpers
    func getBooks(completion block: @escaping (Error?) -> Void) {
        SessionManager.getBooks { [weak self] (books, error) in
            guard error == nil else {
                block(error)
                return
            }
            guard let books = books else {
                block(CustomError.generalError)
                return
            }
            guard let strongSelf = self else {
                block(CustomError.generalError)
                return
            }
            strongSelf.books = books
            block(nil)
        }
    }
    
    func numberOfBooks() -> Int {
        return books?.count ?? 0
    }
    
    func book(at indexPath: IndexPath) -> Book? {
        guard let books = books else { return nil }
        return books[indexPath.row]
    }
}
