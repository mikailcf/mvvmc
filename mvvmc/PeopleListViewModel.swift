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
    func setFilterAs(filterActive: Bool, feedback: PeopleListFeedback)
    func showPersonAtIndex(index: Int)
}

protocol PeopleListFeedback {

    func didLoadPeopleList(error: DataError?)
    func didChangeFilter(isFilterActive: Bool)
}

class PeopleListViewModel: PeopleListDataSource, PeopleListDelegate {

    fileprivate let coordinator: MainCoordinator

    var originalPeopleList: [Person]? = nil

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }

    // MARK: PeopleListDataSource

    var peopleList: [Person]? = nil

    // MARK: PeopleListDelegate

    func loadPeopleList(feedback: PeopleListFeedback) {
        DataManager.getPeopleList { (peopleList: [Person]?, error: DataError?) in
            if let peopleList = peopleList {
                self.originalPeopleList = peopleList
                self.peopleList = peopleList
            }

            feedback.didLoadPeopleList(error: error)
        }
    }

    func setFilterAs(filterActive: Bool, feedback: PeopleListFeedback) {
        self.peopleList = filterActive ? Array(peopleList?.prefix(2) ?? []) : originalPeopleList
        feedback.didChangeFilter(isFilterActive: filterActive)
    }

    func showPersonAtIndex(index: Int) {
        coordinator.showFirstDetails(index: index)
    }
}
