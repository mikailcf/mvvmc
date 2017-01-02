//
//  FirstViewModel.swift
//  mvvmc
//
//  Created by Mikail Freitas on 02/01/17.
//  Copyright © 2017 Mikail. All rights reserved.
//

import Foundation

protocol FirstViewDelegate {
    
    func showPeopleList()
}

class FirstViewModel {

    fileprivate let coordinator: MainCoordinator

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
}

extension FirstViewModel: FirstViewDelegate {

    func showPeopleList() {
        coordinator.showPeopleList()
    }
}
