//
//  Photo.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation
import Spine

struct Photo {
    let title: String
    let url: URL

    init(with title: String, url: URL) {
        self.title = title
        self.url = url
    }

     init(jsonPhoto: PhotoJSON?) {
        let title = jsonPhoto?.title ?? ""
        let url = jsonPhoto?.url ?? URL(string: "www.nil.com")!
        self.init(with: title, url: url)
    }
}
