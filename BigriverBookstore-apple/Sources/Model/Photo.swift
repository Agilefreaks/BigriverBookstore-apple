//
//  Photo.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation

struct Photo {
    let title: String
    let url: URL

    init(with title: String, url: URL) {
        self.title = title
        self.url = url
    }

    init?(jsonPhoto: PhotoJSON?) {
        guard let tile = jsonPhoto?.title, let url = jsonPhoto?.url else {
            return nil
        }
        self.title = tile
        self.url = url
    }
}
