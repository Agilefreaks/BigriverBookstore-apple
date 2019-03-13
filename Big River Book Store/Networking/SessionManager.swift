//
//  SessionManager.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Alamofire
import Foundation
import Japx

class SessionManager {
    static let shared = SessionManager()
    private static let sharedInstance: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        return Alamofire.SessionManager(configuration: configuration)
    }()

    static func getResources<T: JapxCodable>(type _: T.Type, path: URLPath, includeList: String, completion block: @escaping ([T]?, Error?) -> Void) {
        guard let url = URLCreator.url(with: path, includeList: includeList) else {
            block(nil, CustomError.generalError)
            return
        }
        sharedInstance.request(url, method: .get, encoding: JSONEncoding.default)
            .validate()
            .responseCodableJSONAPI(queue: DispatchQueue.global(qos: .background), includeList: includeList, keyPath: "data") { (response: DataResponse<[T]>) in
                switch response.result {
                case let .failure(error):
                    block(nil, error)
                case let .success(value):
                    block(value, nil)
                }
            }
    }

    static func getResource<T: JapxCodable>(type _: T.Type, path: URLPath, includeList: String, resourceID: String, completion block: @escaping (T?, Error?) -> Void) {
        guard let url = URLCreator.url(with: path, includeList: includeList, resourceID: resourceID) else {
            block(nil, CustomError.generalError)
            return
        }
        sharedInstance.request(url, method: .get, encoding: JSONEncoding.default)
            .validate()
            .responseCodableJSONAPI(queue: DispatchQueue.global(qos: .background), includeList: includeList, keyPath: "data") { (response: DataResponse<T>) in
                switch response.result {
                case let .failure(error):
                    block(nil, error)
                case let .success(value):
                    block(value, nil)
                }
            }
    }
}
