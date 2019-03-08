//
//  Author.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

struct Author {
    let name: String
    let id:String

    init(with name: String, id:String) {
        self.name = name
        self.id = id
    }

    init?(jsonAuthor: AuthorJSON?) {
        guard let name = jsonAuthor?.name, let id = jsonAuthor?.id else {
            return nil
        }
        self.name = name
        self.id = id
    }
}
