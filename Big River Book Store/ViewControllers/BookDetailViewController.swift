//
//  BookDetailViewController.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    // MARK: - Variables

    var viewModel: BookDetailViewModel!

    // MARK: - IBOutlets

    @IBOutlet private var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(BookPhotoCollectionViewCell.self)
        }
    }

    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(BookDetailTableViewCell.self)
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Setup

    private func setup() {
        viewModel.getBook { [weak self] error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.presentAlert(with: "Error", message: error!.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                strongSelf.collectionView.reloadData()
                strongSelf.tableView.reloadData()
                strongSelf.title = strongSelf.viewModel.nameOfBook() ?? ""
            }
        }
    }
}

extension BookDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return viewModel.numberOfPhotos()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BookPhotoCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        if let imageUrl = viewModel.photoUrl(at: indexPath) {
            cell.configure(with: imageUrl)
        }
        return cell
    }
}

extension BookDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize(width: width, height: height)
    }
}

extension BookDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BookDetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension BookDetailViewController: Storyboarded {
    static var storyboardName: String {
        return "Main"
    }
}
