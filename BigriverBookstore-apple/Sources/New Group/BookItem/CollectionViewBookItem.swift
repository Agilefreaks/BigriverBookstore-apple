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

    weak var delegate: CollectionViewBookItemDelegate?

    var bookInfo: Book? {
        didSet {
            guard let book = bookInfo else {
                return
            }
            bookTitleTextField.stringValue = book.title
            bookTitleTextField.toolTip = bookTitleTextField.stringValue
            authorNameTextField.stringValue = book.author.name
            authorNameTextField.toolTip = authorNameTextField.stringValue

            if !book.photos.isEmpty {
                AsyncImageLoading().loadImageFrom(url: book.photos[0].url) { image in
                    DispatchQueue.main.async { self.bookCoverImageView.image = image }
                }
            } else { bookCoverImageView.image = #imageLiteral(resourceName: "bookCoverPlaceholder") }
        }
    }

    @IBAction func showMoreDetailsAboutCurrentBook(_ sender: Any) {
        if let book = bookInfo {
            delegate?.showMoreDetailsAbout(book: book)
        }
    }
}
