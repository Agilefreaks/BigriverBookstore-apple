//
//  CollectionViewDetailsPhotoItem.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 07/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Cocoa

class CollectionViewDetailsPhotoItem: NSCollectionViewItem {
    @IBOutlet var currentImageView: NSImageView!
    weak var delegate: CollectionViewDetailsPhotoItemDelegate?
    var photoInfo: Photo? {
        didSet {
            guard let photoInfo = photoInfo else {
                currentImageView.image = #imageLiteral(resourceName: "bookCoverPlaceholder")
                return
            }
            AsyncImageLoading().loadImageFrom(url: photoInfo.url) { image in
                DispatchQueue.main.async { self.currentImageView.image = image }
            }
        }
    }

    @IBAction func clickOnPictureAction(_ sender: Any) {
        if let image = currentImageView.image {
            delegate?.pictureWasCliked(theImage: image)
        }
    }
}
