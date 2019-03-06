//
//  Photo.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation
import Spine

class Photo {
    var title: String
    var url:URL
    
    init(with title:String, url:URL) {
        self.title = title
        self.url = url
    }
    
    convenience init(jsonPhoto:PhotoJSON?) {
        let title = jsonPhoto?.title ?? ""
        let url = jsonPhoto?.url ?? URL.init(string: "www.nil.com")!
        self.init(with: title, url: url)
    }
}
