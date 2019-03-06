//
//  Photo.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation
import Spine

class Photo: Resource {
    var title: String?
    var uri: URL?

    override class var resourceType: ResourceType {
        return "photos"
    }

    override class var fields: [Field] {
        return fieldsFromDictionary([
            "title": Attribute(),
            "uri": URLAttribute()
        ])
    }
}
