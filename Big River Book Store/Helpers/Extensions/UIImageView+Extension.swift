//
//  UIImageView+Extension.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func setImage(with url: URL) {
        self.af_setImage(withURL: url)
    }
}
