//
//  Repository.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

protocol BookRepositoryProtocol {
    func getAll(include: [String], completion block: @escaping ([Book]?, Error?) -> Void)
    func get(include: [String], resourceID: String, completion block: @escaping (Book?, Error?) -> Void)
}
