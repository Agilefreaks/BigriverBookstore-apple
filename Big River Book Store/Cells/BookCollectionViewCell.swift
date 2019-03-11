//
//  BookCollectionViewCell.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var bookCoverImageView: UIImageView!
    @IBOutlet private weak var bookTitleLabel: UILabel!
    @IBOutlet private weak var bookAuthorLabel: UILabel!
    @IBOutlet private weak var bgView: UIView!
}

extension BookCollectionViewCell: NibLoadableView, ReusableView {}
