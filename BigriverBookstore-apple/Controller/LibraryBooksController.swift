//
//  LibraryBooksController.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Cocoa

class LibraryBooksController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        printListWithBooks()
    }
    
    
    private func printListWithBooks() {
        //Retrieve a list with all books
        APIConexion.retrieveBookList { (bookList) in
            bookList.forEach({ (book) in
                print(book.title ?? "No title")
                print(book.isbn ?? 0)
                print("---")
            })
        }
    }
}
