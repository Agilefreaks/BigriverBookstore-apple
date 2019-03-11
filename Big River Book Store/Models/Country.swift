//
//  Country.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Vox

class Country: Resource {
    
    // MARK: - Attributes
    @objc dynamic
    var name: String?
    
    // MARK: - Resource type
    override class var resourceType: String {
        return "countries"
    }
}
