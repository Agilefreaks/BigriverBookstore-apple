//
//  CustomError.swift
//  Big River Book Store
//
//  Created by Florin Uscatu on 11/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

public enum CustomError: Error {
    case generalError
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .generalError:
            return NSLocalizedString("Oops, something went wrong, please try again", comment: "General Error")
        }
    }
}
