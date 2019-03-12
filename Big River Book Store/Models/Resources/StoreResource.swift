//
//  Store.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Vox

class StoreResource: Resource {
    // MARK: - Attributes

    @objc dynamic
    var name: String?

    @objc dynamic
    var address: String?

    @objc dynamic
    var createdBy: NSNumber?

    // MARK: - Relationships

    @objc dynamic
    var photos: PhotoResource?

    @objc dynamic
    var books: BookResource?

    // MARK: - Resource type

    override class var resourceType: String {
        return "stores"
    }

    // MARK: - CodingKeys

    override class var codingKeys: [String: String] {
        return [
            "created_by": "createdBy",
        ]
    }
}
