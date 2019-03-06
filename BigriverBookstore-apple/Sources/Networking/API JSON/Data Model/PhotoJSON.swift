//
//  Photo.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 06/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation
import Spine

class PhotoJSON: Resource {
    var title: String?

    override class var resourceType: ResourceType {
        return "photos"
    }

    override class var fields: [Field] {
        return fieldsFromDictionary([
            "title": Attribute(),
            "url": URLAttribute().serializeAs("uri")
        ])
    }
}
