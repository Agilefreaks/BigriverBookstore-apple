//
//  BookPhotoCollectionViewCell.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class BookPhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 5.0
            imageView.clipsToBounds = true
        }
    }

    func configure(with imageUrl: String) {
        imageView.setImage(with: URL(string: imageUrl)!)
    }
}
