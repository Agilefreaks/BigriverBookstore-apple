//
//  Store.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 13/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct Store {
    let id: String
    let name: String

    static func from(_ storeResource: StoreResource) -> Store {
        return Store(id: storeResource.id, name: storeResource.name)
    }
}
