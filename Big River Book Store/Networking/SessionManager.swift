//
//  SessionManager.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Alamofire
import Vox

class SessionManager {
    
    static let shared = SessionManager()
    static private let sharedInstance: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        configuration.httpMaximumConnectionsPerHost = 10
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    static func getResources<T: Resource>(type: T.Type, path: String, include: [String], completion block: @escaping ([T]?, Error?) -> Void) {
        guard let url = URL(string: URLCreator.baseURL) else { return }
        let client = JSONAPIClient.Alamofire(baseURL: url)
        let dataSource = DataSource<T>(strategy: .path(path), client: client)
        do {
            try dataSource.fetch()
                .include(include)
                .result({ (document: Document<[T]>) in
                    guard let resources = document.data else { return }
                    block(resources, nil)
                }, { (error) in
                    block(nil, error)
                })
        } catch let error {
            block(nil, error)
        }
    }
    
}
