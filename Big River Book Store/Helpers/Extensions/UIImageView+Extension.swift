//
//  UIImageView+Extension.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import AlamofireImage
import UIKit

extension UIImageView {
    func setImage(with url: URL) {
        af_setImage(withURL: url)
    }
}
