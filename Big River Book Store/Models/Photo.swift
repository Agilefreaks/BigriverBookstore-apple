//
//  Photo.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Vox

class Photo: Resource {
    
    // MARK: - Attributes
    @objc dynamic
    var title: String?
    
    @objc dynamic
    var uri: String?
    
    // MARK: - Resource type
    override class var resourceType: String {
        return "photos"
    }
}
