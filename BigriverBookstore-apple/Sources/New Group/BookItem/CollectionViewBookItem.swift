//
//  BookItem.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Cocoa

class CollectionViewBookItem: NSCollectionViewItem {
    @IBOutlet var bookTitleTextField: NSTextField!
    @IBOutlet var authorNameTextField: NSTextField!
    @IBOutlet var bookCoverImageView: NSImageView!

    var bookInfo: Book? {
        didSet {
            if let book = bookInfo {
                bookTitleTextField.stringValue = book.title
                bookTitleTextField.toolTip = bookTitleTextField.stringValue
                authorNameTextField.stringValue = book.author.name
                authorNameTextField.toolTip = authorNameTextField.stringValue
                if !book.photos.isEmpty {
                    loadImage(from: book.photos[0].url)
                }
            }
        }
    }

    private func loadImage(from url: URL) {
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            if let imageData = imageData {
                DispatchQueue.main.async { self.bookCoverImageView.image = NSImage(data: imageData) }
            }
        }
    }
}
