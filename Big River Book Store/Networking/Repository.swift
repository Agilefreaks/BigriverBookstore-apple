//
//  Repository.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 12/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

protocol BookRepositoryProtocol {
    func getAll(completion block: @escaping ([Book]?, Error?) -> Void)
    func get(with id: String, completion block: @escaping (Book?, Error?) -> Void)
}
