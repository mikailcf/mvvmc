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

    private static func mockPeopleList() -> [Person] {
        return (1..<10).map({ Person.init(mockParameter: $0) })
    }

    private static func getLocalPeopleList() -> [Person] {
        return mockPeopleList()
    }

    static func getPeopleList(callback: @escaping ((_ peopleList: [Person]?, _ error: DataError?) -> Void)) {
        let error: DataError? = nil

        // the server request should be made here, wrapping any server error in the error: DataError above

        // delay for illustration's sake
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            if let error = error {
                callback(getLocalPeopleList(), error)
            } else {
                callback(mockPeopleList(), nil)
            }
        })
    }

    static func getPerson(index: Int, callback: @escaping ((_ person: Person?, _ error: DataError?) -> Void)) {
        let error: DataError? = nil

        // the server request should be made here, wrapping any server error in the error: DataError above

        // delay for illustration's sake
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            if let error = error {
                callback(getLocalPeopleList()[index], error)
            } else {
                callback(mockPeopleList()[index], nil)
            }
        })
    }
}
