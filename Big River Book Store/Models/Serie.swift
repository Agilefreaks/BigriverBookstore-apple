//
//  Serie.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Vox

class Serie: Resource {
    
    // MARK: - Attributes
    @objc dynamic
    var title: String?
    
    // MARK: - Relationships
    @objc dynamic
    var photos: [Photo]?
    
    @objc dynamic
    var books: [Book]?
    
    // MARK: - Resource type
    override class var resourceType: String {
        return "series"
    }
}
