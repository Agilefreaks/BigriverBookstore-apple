//
//  Author.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 13/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct Author {
    let id: String
    let name: String

    static func from(_ authorResource: AuthorResource) -> Author {
        return Author(id: authorResource.id,
                      name: authorResource.name)
    }
}
