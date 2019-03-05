//
//  APIService.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 05/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation

protocol APIService {
    func retrieveBookList(completionHandler: (([Book]) -> Void)?)
}
