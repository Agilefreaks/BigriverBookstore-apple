//
//  LibraryBooksViewModel.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation

class LibraryBooksViewModel {
    var currentBookList: [Book] = []
    
    var refreshData: (() -> Void)?
    
    private var apiService: APIService
    
    init(with apiService: APIService = APIJSONConnexion()) {
        self.apiService = apiService
    }
    
    func loadBookList() {
        apiService.retrieveBookList { bookList in
            self.currentBookList = bookList
            self.refreshData?()
        }
    }
}
