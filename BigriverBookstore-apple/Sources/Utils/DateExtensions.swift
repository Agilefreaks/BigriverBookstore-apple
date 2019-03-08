//
//  DateExtensions.swift
//  BigriverBookstore-apple
//
//  Created by Viorel Porumbescu on 07/03/2019.
//  Copyright © 2019 AgileFreaks. All rights reserved.
//

import Foundation

extension Date {
    enum Format: String {
        case yyyymmdd = "yyyy-mm-dd"
        case mmddyyyy = "mm-dd-yyyy"
    }

    func stringWith(format: Format = .yyyymmdd) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}
