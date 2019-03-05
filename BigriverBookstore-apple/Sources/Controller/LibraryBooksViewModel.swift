//
//  LibraryBooksViewModel.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation

class LibraryBooksViewModel {
    var currentBookList: [Book] = [] {
        didSet {
            printCurrentBookList()
        }
    }
    var refreshData: (() -> Void)?
    
    private var apiService: APIService
    
    init(with apiService: APIService = APIConnexion()) {
        self.apiService = apiService
    }
    
    func loadBookList() {
        apiService.retrieveBookList { bookList in
            self.currentBookList = bookList
            self.refreshData?()
        }
    }
    
    private func printCurrentBookList() {
        currentBookList.forEach({ book in
            print("----------------")
            print(book.title ?? "No title")
            print(book.isbn ?? 0)
        })
    }
}
