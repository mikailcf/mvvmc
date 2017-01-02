//
//  DataManager.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import Foundation

enum DataError {
    case Offline
    case ServerGenericError
    case Empty
}

class DataManager {
    static func getLocalPersonsList() -> [Person] {
        return (1..<10).map({ Person.init(mockParameter: $0) })
    }

    static func getRemotePersonsList(callback: ((_ personsList: [Person]?, _ error: DataError?) -> Void), mockError: DataError? = nil) {
        if let mockError = mockError {
            callback(nil, mockError)
        } else {
            callback(getLocalPersonsList(), nil)
        }
    }
}
