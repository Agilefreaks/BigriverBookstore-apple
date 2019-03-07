//
//  LibraryBooksController.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Cocoa

class LibraryBooksController: NSViewController, NSCollectionViewDataSource {
    @IBOutlet var libraryBooksCollectionView: NSCollectionView!
    private var libraryBooks = LibraryBooksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLibraryCollectionView()
        libraryBooks.loadBookList()
        libraryBooks.refreshData = {
            DispatchQueue.main.async {
                self.libraryBooksCollectionView.reloadData()
            }
        }
    }
    
    private func configureLibraryCollectionView() {
        libraryBooksCollectionView.register(CollectionViewBookItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("bookItem"))
        libraryBooksCollectionView.dataSource = self
    }
    
    // MARK: - Collection view datasource
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return libraryBooks.currentBookList.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let currentItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("bookItem"), for: indexPath)
        
        guard let currentBookItem = currentItem as? CollectionViewBookItem else {
            print("Error!")
            return NSCollectionViewItem()
        }
        currentBookItem.bookInfo = libraryBooks.currentBookList[indexPath.item]
        return currentBookItem
    }
}
