//
//  URLCreator.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

enum URLCreator {
    private static let baseURL = "http://jsonapiplayground.reyesoft.com/v2/"
    public static let authors = baseURL + "authors"
    public static let books = baseURL + "books"
}