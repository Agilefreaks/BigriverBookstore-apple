//
//  BookCollectionViewCell.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var bookCoverImageView: UIImageView!
    @IBOutlet private var bookTitleLabel: UILabel!
    @IBOutlet private var bookAuthorLabel: UILabel!
    @IBOutlet private var bgView: UIView!

    func configure(with viewModel: BookViewModel) {
        bookTitleLabel.text = viewModel.title
        bookAuthorLabel.text = viewModel.author
        guard let imageURL = viewModel.mainPhotoURL, let url = URL(string: imageURL) else { return }
        bookCoverImageView.setImage(with: url)
    }
}
