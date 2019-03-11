//
//  Chapter.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Vox

class Chapter: Resource {
    
    // MARK: - Attributes
    @objc dynamic
    var title: String?
    
    @objc dynamic
    var ordering: NSNumber?
    
    // MARK: - Relationships
    @objc dynamic
    var photos: [Photo]?
    
    @objc dynamic
    var book: Book?
    
    // MARK: - Resource type
    override class var resourceType: String {
        return "chapters"
    }
}
