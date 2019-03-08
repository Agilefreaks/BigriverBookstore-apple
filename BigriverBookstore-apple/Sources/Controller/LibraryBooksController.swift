//
//  LibraryBooksController.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Cocoa

class LibraryBooksController: NSViewController, NSCollectionViewDataSource, CollectionViewBookItemDelegate {
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

    @IBAction func AddAuthorFilter(_ sender:Any){
        applyFilterFor(author: Author.init(with: "Miss Noemy Paucek DVM", id: "7"))
    }

    func applyFilterFor(author: Author) {
        libraryBooks.loadBookListFilteredBy(author: author)
    }

    private func configureLibraryCollectionView() {
        libraryBooksCollectionView.register(CollectionViewBookItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("bookItem"))
        libraryBooksCollectionView.dataSource = self
    }

    // MARK: - CollectionViewBookItemDelegate

    func showMoreDetailsAbout(book: Book) {
        if let newController = storyboard?.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("BookDetailsViewController")) as? BookDetailsViewController, let windowController = self.view.window?.contentViewController as? MainNavigationViewController {
            newController.book = book
            windowController.pushNewControllerInNavigationStack(from: self, to: newController, withSectionName: book.title)
        }
    }

    // MARK: - Collection view datasource

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return libraryBooks.currentBookList.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let currentItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("bookItem"), for: indexPath)

        guard let currentBookItem = currentItem as? CollectionViewBookItem else {
            return NSCollectionViewItem()
        }
        currentBookItem.bookInfo = libraryBooks.currentBookList[indexPath.item]
        currentBookItem.delegate = self
        return currentBookItem
    }
}
