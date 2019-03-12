//
//  URLCreator.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

enum URLCreator {
    static let baseURL = "http://jsonapiplayground.reyesoft.com/v2"
    static let authors = "/authors"
    static let books = "/books"
    static let photots = "/photos"

    static func author(with id: String) -> String {
        return authors + "/" + id
    }
}
