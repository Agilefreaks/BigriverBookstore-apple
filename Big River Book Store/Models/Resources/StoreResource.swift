//
//  Store.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Japx

struct StoreResource: JapxCodable {
    var type: String
    var id: String
    var name: String
    var address: String
    var photos: [PhotoResource]?
    var books: [BookResource]?
}
