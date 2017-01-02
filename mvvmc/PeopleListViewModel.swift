//
//  PeopleListViewModel.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import Foundation

protocol PeopleListDataSource {

    var peopleList: [Person]? { get }
}

protocol PeopleListDelegate {

    func loadPeopleList(feedback: PeopleListFeedback)
}

protocol PeopleListFeedback {

    func didLoadPeopleList(error: DataError?)
}

class PeopleListViewModel: PeopleListDataSource {

    fileprivate let coordinator: MainCoordinator

    // extensions can't have stored properties, so this breaks the `extension for protocol` pattern
    var peopleList: [Person]? = nil

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension PeopleListViewModel: PeopleListDelegate {

    func loadPeopleList(feedback: PeopleListFeedback) {
        DataManager.getPeopleList { (peopleList: [Person]?, error: DataError?) in
            // async for illustration's sake
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                if let peopleList = peopleList {
                    self.peopleList = peopleList
                }

                feedback.didLoadPeopleList(error: error)
            })
        }
    }
}
