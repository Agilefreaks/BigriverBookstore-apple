//
//  BookPhotoCollectionViewCell.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class BookPhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView!

    func configure(with imageUrl: String) {
        imageView.setImage(with: URL(string: imageUrl)!)
    }
}
