//
//  BookDetailsViewController.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 07/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Cocoa

class BookDetailsViewController: NSViewController, NSCollectionViewDataSource, CollectionViewDetailsPhotoItemDelegate {
    @IBOutlet var bookTitleTextField: NSTextField!
    @IBOutlet var bookAuthorLinkButton: NSButton!
    @IBOutlet var publishingDateTextField: NSTextField!
    @IBOutlet var coverImageView: NSImageView!
    
    @IBOutlet var collectionViewWithAllImages: NSCollectionView!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        if let book = book { loadBook(book: book) }
    }
    
    private func loadBook(book: Book) {
        bookTitleTextField.stringValue = book.title
        bookAuthorLinkButton.title = book.author.name
        publishingDateTextField.stringValue = book.publishingDate.stringWith(format: .yyyymmdd)
        if let photo = book.photos.first {
            loadImage(from: photo.url)
        }
    }
    
    private func loadImage(from url: URL) {
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            if let imageData = imageData {
                DispatchQueue.main.async { self.coverImageView.image = NSImage(data: imageData) }
            }
        }
    }
    
    private func configureCollectionView() {
        collectionViewWithAllImages.register(CollectionViewDetailsPhotoItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("collectionItem"))
        collectionViewWithAllImages.dataSource = self
    }
    
    // MARK: - CollectionViewDetailsPhotoItemDelegate
    
    func pictureWasCliked(theImage: NSImage) {
        coverImageView.image = theImage
    }
    
    // MARK: - Collection view Datasource
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.photos.count ?? 0
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let currentItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("collectionItem"), for: indexPath)
        
        guard let photoItem = currentItem as? CollectionViewDetailsPhotoItem, let bookInfo = book else {
            print("Error!")
            return NSCollectionViewItem()
        }
        photoItem.photoInfo = bookInfo.photos[indexPath.item]
        photoItem.delegate = self
        return photoItem
    }
}
