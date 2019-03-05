//
//  BookItem.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Cocoa

class CollectionViewBookItem: NSCollectionViewItem {
    @IBOutlet weak var bookTitleTextField:NSTextField!
    @IBOutlet weak var authorNameTextField:NSTextField!
    @IBOutlet weak var bookCoverImageView:NSImageView!
    
    var bookInfo:Book? {
        didSet{
            if let book = bookInfo {
                bookTitleTextField.stringValue = book.title ?? "No title"
                authorNameTextField.stringValue = book.author?.name ?? "No name"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
