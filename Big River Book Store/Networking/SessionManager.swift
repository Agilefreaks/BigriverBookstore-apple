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
    
    static func getBooks(completion block: @escaping ([Book]?, Error?) -> Void) {
        guard let url = URL(string: URLCreator.baseURL) else { return }
        let client = JSONAPIClient.Alamofire(baseURL: url)
        let dataSource = DataSource<Book>(strategy: .path(URLCreator.books), client: client)
        do {
            try dataSource.fetch()
                .result({ (document: Document<[Book]>) in
                    guard let books = document.data else { return }
                    block(books, nil)
                }, { (error) in
                    block(nil, error)
                })
        } catch let error {
            block(nil, error)
        }
    }
    
}
