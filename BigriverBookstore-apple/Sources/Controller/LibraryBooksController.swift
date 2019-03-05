//
//  LibraryBooksController.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Cocoa

class LibraryBooksController: NSViewController {
    var libraryBooks = LibraryBooksViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        libraryBooks.loadBookList()
        libraryBooks.refreshData = {}
    }
}
