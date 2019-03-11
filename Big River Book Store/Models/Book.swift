//
//  Book.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Vox

class Book: Resource {
    
    // MARK: - Attributes
    @objc dynamic
    var title: String?
    
    @objc dynamic
    var datePublished: String?
    
    @objc dynamic
    var isbn: NSNumber?
    
    // MARK: - Relationships
    @objc dynamic
    var author: Author?
    
    @objc dynamic
    var chapters: [Chapter]?
    
    @objc dynamic
    var photos: [Photo]?
    
    @objc dynamic
    var series: Serie?
    
    @objc dynamic
    var stores: [Store]?
    
    // MARK: - Resource type
    override class var resourceType: String {
        return "books"
    }
    
    // MARK: - CodingKeys
    override class var codingKeys: [String : String] {
        return [
            "date_published": "datePublished"
        ]
    }
}
