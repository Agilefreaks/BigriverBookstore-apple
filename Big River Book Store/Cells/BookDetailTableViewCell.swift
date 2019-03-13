//
//  BookDetailTableViewCell.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class BookDetailTableViewCell: UITableViewCell {
    @IBOutlet private var detailLabel: UILabel!

    func configure(with detail: String) {
        detailLabel.text = detail
    }
}
