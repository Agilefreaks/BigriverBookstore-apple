//
//  Author.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation

struct Author {
    let name: String

    init(with name: String) {
        self.name = name
    }

     init(jsonAuthor: AuthorJSON?) {
        let name = jsonAuthor?.name ?? ""
        self.init(with: name)
    }
}
