//
//  BookJSON.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 06/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation
import Spine

class BookJSON: Resource {
    var title: String?
    var author: AuthorJSON?
    var photos: LinkedResourceCollection?

    override class var resourceType: ResourceType {
        return "books"
    }

    override class var fields: [Field] {
        return fieldsFromDictionary([
            "title": Attribute(),
            "author": ToOneRelationship(AuthorJSON.self),
            "photos": ToManyRelationship(PhotoJSON.self)
        ])
    }
}
