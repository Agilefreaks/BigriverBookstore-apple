//
//  Author.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Vox

class AuthorResource: Resource {
    
    // MARK: - Attributes
    @objc dynamic
    var name: String?
    
    @objc dynamic
    var birthplace: String?
    
    @objc dynamic
    var dateOfBirth: String?
    
    @objc dynamic
    var dateOfDeath: String?
    
    // MARK: - Relationships
    @objc dynamic
    var photos: [PhotoResource]?
    
    @objc dynamic
    var books: [BookResource]?
    
    // MARK: - Resource type
    override class var resourceType: String {
        return "authors"
    }
    
    // MARK: - CodingKeys
    override class var codingKeys: [String : String] {
        return [
            "date_of_birth": "dateOfBirth",
            "date_of_death": "dateOfDeath"
        ]
    }
}
