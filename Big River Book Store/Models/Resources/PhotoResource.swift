//
//  Photo.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Japx

struct PhotoResource: JapxCodable {
    var type: String
    var id: String
    var title: String
    var uri: String
}
