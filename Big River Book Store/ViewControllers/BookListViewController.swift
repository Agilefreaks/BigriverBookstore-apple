//
//  ViewController.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.contentInset = collectionViewEdgeInsets
            collectionView.register(BookCollectionViewCell.self)
        }
    }
    
    // MARK: - Variables
    var viewModel: BookListViewModel?
    
    // MARK: - Constants
    let collectionViewCellInset: CGFloat = 30.0
    let numberOfCellsPerRow: CGFloat = 2.0
    let collectionViewCellAspectRatio: CGFloat = 1.5
    let collectionViewEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        title = "BigRiver Bookstore"
        getBooks()
    }
    
    private func getBooks() {
        viewModel?.getBooks { [weak self] error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.presentAlert(with: "Error", message: error!.localizedDescription)
                return
            }
            strongSelf.collectionView.reloadData()
        }
    }
}

extension BookListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfBooks() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BookCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension BookListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - collectionViewCellInset) / numberOfCellsPerRow
        let height = width * collectionViewCellAspectRatio
        return CGSize(width: width, height: height)
    }
}

extension BookListViewController: Storyboarded {
    static var storyboardName: String {
        return "Main"
    }
}
