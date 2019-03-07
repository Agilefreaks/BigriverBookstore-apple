//
//  AuthorJSON.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 06/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation
import Spine

class AuthorJSON: Resource {
    var name: String?

    override class var resourceType: ResourceType {
        return "authors"
    }

    override class var fields: [Field] {
        return fieldsFromDictionary([
            "name": Attribute()
        ])
    }
}
