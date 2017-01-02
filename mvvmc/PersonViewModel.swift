//
//  PersonViewModel.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import Foundation

protocol PersonDelegate {

    func loadPerson(index: Int, feedback: Person1Feedback)
    func changeFirstName(feedback: Person1Feedback)
    func changeNickname(feedback: Person2Feedback)
}

protocol PersonDatasource {

    var fullName: String { get }
    var nickname: String { get }
    var cpf: String { get }
}

protocol Person1Feedback {

    func didChangeFirstName()
}

protocol Person2Feedback {

    func didChangeNickname()
}

class PersonViewModel: PersonDelegate, PersonDatasource {

    private let coordinator: MainCoordinator
    private var person: Person? = nil

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }

    // MARK: PersonDelegate

    func loadPerson(index: Int, feedback: Person1Feedback) {
        DataManager.
    }

    // MARK: PersonDatasource

    var fullName: String {
        if let person = person {
            return "\(person.firstName) \(person.lastName)"
        } else {
            return "             "
        }
    }

    var nickname: String {
        return person?.nickname ?? "       "
    }

    var cpf: String {
        if let person = person {
            return "\(person.cpf)"
        } else {
            return "           "
        }
    }
}
