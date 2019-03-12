//
//  Book.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Vox

class BookResource: Resource {
    
    // MARK: - Attributes
    @objc dynamic
    var title: String?
    
    @objc dynamic
    var datePublished: String?
    
    @objc dynamic
    var isbn: NSNumber?
    
    // MARK: - Relationships
    @objc dynamic
    var author: AuthorResource?
    
    @objc dynamic
    var chapters: [ChapterResource]?
    
    @objc dynamic
    var photos: [PhotoResource]?
    
    @objc dynamic
    var series: SerieResource?
    
    @objc dynamic
    var stores: [StoreResource]?
    
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
