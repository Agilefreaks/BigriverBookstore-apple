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

    static func url(with path: URLPath, includeList: String, resourceID: String? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "jsonapiplayground.reyesoft.com"
        components.path = path.rawValue + ((resourceID != nil) ? "/\(resourceID!)" : "")
        components.queryItems = [URLQueryItem(name: "include", value: includeList)]
        return components.url
    }
}

enum URLPath: String {
    case books = "/v2/books"
    case photos = "/v2/photos"
    case authors = "/v2/authors"
}
