//
//  Book.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 04/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Spine

class Book: Resource {
    var title: String?
    var isbn: NSNumber?

    override class var resourceType: ResourceType {
        return "books"
    }

    override class var fields: [Field] {
        return fieldsFromDictionary([
            "title": Attribute(),
            "isbn": Attribute(),
        ])
    }
}
