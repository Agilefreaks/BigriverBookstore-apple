//
//  BookCollectionViewCell.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit
import AlamofireImage

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var bookCoverImageView: UIImageView!
    @IBOutlet private weak var bookTitleLabel: UILabel!
    @IBOutlet private weak var bookAuthorLabel: UILabel!
    @IBOutlet private weak var bgView: UIView!
    
    func configure(with viewModel: BookViewModel) {
        bookTitleLabel.text = viewModel.title
        bookAuthorLabel.text = viewModel.author
        guard let imageURL = viewModel.mainPhotoURL, let url = URL(string: imageURL) else { return }
        bookCoverImageView.af_setImage(withURL: url)
    }
}

extension BookCollectionViewCell: NibLoadableView, ReusableView {}
