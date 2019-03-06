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
                bookTitleTextField.stringValue = book.title ?? "No title"
                authorNameTextField.stringValue = book.author?.name ?? "No name"
                
                guard let photoCollection = bookInfo?.photos, photoCollection.count > 0, let imageURL = (bookInfo?.photos?[0] as? Photo?)??.uri else {
                    return
                }
                loadImage(from: imageURL)
            }
        }
    }
    
    private func loadImage(from url: URL) {

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url) // make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            if let data = data {
                DispatchQueue.main.async {
                    self.bookCoverImageView.image = NSImage(data: data)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
}
