//
//  SessionManager.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation
import Alamofire

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
    
    
    static func getBooks(completion block: @escaping (Data?, Error?) -> Void) {
        sharedInstance.request(URLCreator.books, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseData { response in
                switch response.result {
                case .failure(let error):
                    print(error)
                    block(nil, error)
                case .success(let value):
                    print(value)
                    block(value, nil)
                }
            }
    }
    
    
}
