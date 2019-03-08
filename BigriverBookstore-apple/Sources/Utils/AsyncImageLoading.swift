//
//  AsyncImageLoading.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 07/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Cocoa

struct AsyncImageLoading {
    func loadImageFrom(url: URL, completion: @escaping ((NSImage?) -> Void)) {
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            if let imageData = imageData {
                completion(NSImage(data: imageData))
            } else {
                completion(nil)
            }
        }
    }
}
